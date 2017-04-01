<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

session_start();

class MY_Controller extends CI_Controller
{ 
	function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
		$this->load->library('parser');
		$this->child = $_SERVER['REQUEST_URI'];
		$this->load->model('Common_model');
		if (isset($_SESSION['user'])) {
			define('USER_ID', $_SESSION['user']['user_id']);
			define('USER_NAME', $_SESSION['user']['user_name']);
			$this->PERMISSIONS = $_SESSION['user']['permissions'];
			if (isset($_SESSION['user']['admin_account_id'])) {
				define('ACCOUNT_ID', $_SESSION['user']['admin_account_id']);
			} else {
				define('ACCOUNT_ID', $_SESSION['user']['account_id']);
			}
		}
	}

	//set the class variable.
	var $template  = array();
	var $data      = array(
		'header_title'	=> 'Header Title',
		'left_title'	=> 'Left Title',
		'footer_title'	=> 'Acme Automated Management Application ' . QA_VERSION . ' &copy;' . CURRENT_YEAR,
	);
	//Load layout
	public function layout()
	{
		$conditions 				= "account_id = " . ACCOUNT_ID . " AND latitude <> 0 AND longitude <> 0";
		$header_data['sites'] 		= $this->Common_model->search($conditions, 'sites');
		$conditions	= "active = 1 AND parent_id = 0";
		$modules 	= $this->Common_model->search($conditions, 'modules', '', '', 'order_by');
		$authorized_modules = '';
		foreach ($modules as $object) {
			$url = 'javascript:void(0)';
			if ($object->controller != '') {
				$url = '/' . $object->controller . '/' . $object->method; 
			}
			if (in_array($object->id, $this->PERMISSIONS)) {
				$authorized_modules .= '<div class="dropdown"><button class="btn btn-default menu-button dropdown-toggle" type="button" onclick="location.href=\'' . $url . '\'" data-toggle="dropdown">' . $object->name . '</button>';
			}
			$conditions1	= "active = 1 AND parent_id = " . $object->id;
			$children1 = $this->Common_model->search($conditions1, 'modules', '', '', 'order_by');
			if (count($children1) > 0) {
				$authorized_modules .= '<ul class="dropdown-menu">';
					foreach ($children1 as $child1) {
						$conditions2= "active = 1 AND parent_id = " . $child1->id;
						$children2 	= $this->Common_model->search($conditions2, 'modules', '', '', 'order_by');
						$a_class	= '';
						$li_class	= '';
						$span_class	= '';
						if (count($children2) > 0) {
							$a_class	= 'test';
							$li_class	= 'dropdown-submenu';
							$span_class = 'caret';
						}
						$child1_url = 'javascript:void(0)';
						if ($child1->controller != '') {
							$child1_url = '/' . $child1->controller . '/' . $child1->method;
						}
						if (in_array($child1->id, $this->PERMISSIONS)) {
							$authorized_modules .= '<li class="' . $li_class . '"><a href="' . $child1_url . '" class="'. $a_class . '" tabindex="-1">' . $child1->name . '<span class="' . $span_class . '"></span></a>';
						}
						if (count($children2) > 0) {
							$authorized_modules .= '<ul class="dropdown-menu">';
							foreach ($children2 as $child2) {
								$conditions3= "active = 1 AND parent_id = " . $child2->id;
								$children3 	= $this->Common_model->search($conditions3, 'modules', '', '', 'order_by');
								$a_class	= '';
								$li_class	= '';
								$span_class	= '';
								if (count($children3) > 0) {
									$a_class	= 'test';
									$li_class	= 'dropdown-submenu';
									$span_class = 'caret';
								}
								$child2_url = 'javascript:void(0)';
								if ($child2->controller != '') {
									$child2_url = '/' . $child2->controller . '/' . $child2->method;
								}	
								if (in_array($child2->id, $this->PERMISSIONS)) {
									$authorized_modules .= '<li class="' . $li_class . '"><a href="' . $child2_url . '" class="'. $a_class . '" tabindex="-1">' . $child2->name . '<span class="' . $span_class . '"></span></a>';
								}
								if (count($children3) > 0) {
									$authorized_modules .= '<ul class="dropdown-menu">';
									foreach ($children3 as $child3) {
										$child3_url = 'javascript:void(0)';
										if ($child3->controller != '') {
											$child3_url = '/' . $child3->controller . '/' . $child3->method;
										}	
										if (in_array($child3->id, $this->PERMISSIONS)) {
											$authorized_modules .= '<li><a href="' . $child3_url . '" tabindex="-1">' . $child3->name . '</a></li>';
										}
									}
									$authorized_modules .= '</ul>';
								}
							}
							$authorized_modules .= '</li></ul>';
						}
					}
				$authorized_modules .= '</li></ul>';
			}
			$authorized_modules .= '</div>';
		}
		$header_data['modules']		= $authorized_modules;
		$this->template['header']	= $this->parser->parse('layout/header', $header_data, true);
		$this->template['left']		= $this->parser->parse('layout/left', $this->data, true);
		$this->template['middle']	= $this->parser->parse($this->middle, $this->method_data, true);
		$this->template['footer']	= $this->parser->parse('layout/footer', $this->data, true);
		$this->parser->parse('layout/index', $this->template);
	}

	public function layout_no_frills()
	{
		$this->template['middle'] = $this->parser->parse($this->middle, $this->method_data, true);
		$this->template['footer']	= $this->parser->parse('layout/footer', $this->data, true);
		$this->parser->parse('layout/welcome', $this->template);
	}
	
	public function is_authenticated()
	{
		if (!(isset($_SESSION['user']))) {
			redirect('/');
		}
	}

	public function change_status($tablename)
	{
		$id				= $this->input->post('id', TRUE);
		$data['active']	= $this->input->post('active', TRUE);

		$this->Common_model->update($data, array('id' => $id), $tablename);

		$object = $this->Common_model->fetch_object(array('id' => $id), $tablename);
		$entity = str_replace('_', ' ', ucfirst(rtrim($tablename, 's')));
		
		if ($data['active'] == 1) {
			$action = 'reactivated';
		} else {
			$action = 'deactivated';
		}

		$log['account_id']	= ACCOUNT_ID;
		if ($tablename == 'users') {
			$log['object_name'] = $object->first_name . ' ' . $object->last_name;
			$other_name = $object->user_name;
		} else {
			$log['object_name'] = $object->name;
			$other_name = $object->name;
		}
		$log['table']		= $tablename;
		$log['foreign_id']	= $id;
		$log['action']		= 'UPDATE';
		$log['description']	= $entity . ' - ' . $other_name . '  ' . $action;
		$log['created_by'] 	= USER_ID;

		$this->Common_model->insert($log, 'admin_log');
	}

	public function delete($tablename)
	{
		$id						= $this->input->post('id', TRUE);
		$object_id				= 'id';
		$object_tablename		= $tablename;
		if ($tablename == 'device_measurements') {
			$object_id 			= 'measurement_id';
			$object_tablename 	= 'measurements';
		}
		$object = $this->Common_model->fetch_object(array('id' => $id), $object_tablename);

		$this->Common_model->delete(array($object_id => $id), $tablename);

		$log['account_id'] = ACCOUNT_ID;
		if ($tablename == 'users') {
			$log['object_name'] = $object->first_name . ' ' . $object->last_name;
			$other_name = $object->user_name;
			$entity = 'User';
		} else {
			$log['object_name'] = $object->name;
			$other_name = $object->name;
			$entity = str_replace('_', ' ', ucfirst(rtrim($tablename, 's')));
		}
		$log['table']		= $tablename;
		$log['foreign_id']	= $id;
		$log['action']		= 'DELETE';
		$log['description']	= $entity . ' - ' . $other_name . ' deleted';
		$log['created_by'] 	= USER_ID;

		$this->Common_model->insert($log, 'admin_log');
	}

	public function pagination_links($base_url, $total_rows, $per_page)
	{
		$this->load->library('pagination');
		$config['base_url'] = $base_url;
		$config['total_rows'] = $total_rows;
		$config['per_page'] = $per_page;
		$config['full_tag_open'] = '<div class="pagination_div">';
		$config['full_tag_close'] = '</div>';
		$config['first_link'] = '&laquo;First';
		$config['first_tag_open'] = '<div class="page page_first">';
		$config['first_tag_close'] = '</div>';
		$config['last_link'] = 'Last&raquo;';
		$config['last_tag_open'] = '<div class="page page_last">';
		$config['last_tag_close'] = '</div>';
		$config['next_link'] = 'Next&rsaquo;';
		$config['next_tag_open'] = '<div class="page page_next">';
		$config['next_tag_close'] = '</div>';
		$config['prev_link'] = '&lsaquo;Prev';
		$config['prev_tag_open'] = '<div class="page page_prev">';
		$config['prev_tag_close'] = '</div>';
		$config['cur_tag_open'] = '<div class="page page_cur">';
		$config['cur_tag_close'] = '</div>';
		$config['num_tag_open'] = '<div class="page page_num">';
		$config['num_tag_close'] = '</div>';
		$config['attributes'] = array('class' => 'page_num_link');
		
		$this->pagination->initialize($config);
		
		return $this->pagination->create_links();
	}

	public function display_date($date)
	{
		return date('m/d/Y h:i:sa', strtotime($date));
	}

	public function insert_relatives($table, $rel_table, $parent_id, $parent_name, $relatives, $log)
	{
		foreach ($relatives as $object) {
			$relative = array();
			echo $object;
			//$child	= $this->Common_model->fetch_object(array('id' => $object), $rel_table);
			switch($table):
				case 'action_tags':
					$relative['tag_id']			= $object;
					$relative['action_id']		= $parent_id;
					$child_type 				= 'tag';
					break;
				case 'device_executions':
					$relative['execution_id']	= $object;
					$relative['device_id']		= $parent_id;
					$child_type 				= 'execution';
					break;
				case 'device_measurements':
					$relative['measurement_id']	= $object;
					$relative['device_id']		= $parent_id;
					$child_type 				= 'measurement';
					break;
				case 'device_triggers':
					$relative['trigger_id']	= $object;
					$relative['device_id']		= $parent_id;
					$child_type 				= 'trigger';
					break;
				case 'execution_tags':
					$relative['tag_id']			= $object;
					$relative['execution_id']	= $parent_id;
					$child_type 				= 'tag';
					break;
				case 'measurement_tags':
					$relative['tag_id']			= $object;
					$relative['measurement_id']	= $parent_id;
					$child_type 				= 'tag';
					break;
				case 'object_devices':
					$relative['device_id']		= $object;
					$relative['object_id']		= $parent_id;
					$child_type 				= 'device';
					break;
				case 'site_objects':
					echo $object;
					$relative['object_id']		= $object;
					$relative['site_id']		= $parent_id;
					$child_type 				= 'object';
					break;
				case 'trigger_actions':
					$relative['action_id']		= $object;
					$relative['trigger_id']		= $parent_id;
					$child_type 				= 'action';
					break;
				case 'trigger_tags':
					$relative['tag_id']			= $object;
					$relative['trigger_id']		= $parent_id;
					$child_type 				= 'tag';
					break;
				case 'user_departments':
					$relative['department_id']	= $object;
					$relative['user_id']		= $parent_id;
					$child_type 				= 'department';
					break;
				case 'user_groups':
					$relative['group_id']		= $object;
					$relative['user_id']		= $parent_id;
					$child_type 				= 'group';
					break;
			endswitch;
			$relative['created_by']	= USER_ID;

			//$this->Common_model->insert($relative, $table);
			print_r($relative);

			$log['action']		= 'INSERT';
			$log['foreign_id']	= $object;
			$log['table']		= $table;
			$log['description'] = $parent_name . ' configured with ' . $child->name . ' ' .$child_type;

			//$this->Common_model->insert($log, 'admin_log');
		}
	}

	public function format_objects($objects)
	{
		foreach ($objects as $object) {
			$new_objects[] = $this->format_object_data($object);
		}

		return $new_objects;
	}

	public function format_object_data($object)
	{
		//print_r($object);
		unset($object->password);
		foreach ($object as $key => $value) {
			if ($key != 'password') {
				if ($key == 'account_id') {
					$name = $this->Common_model->fetch_object(array('id' => $value), 'accounts');
					$object->account_id = $name->name;
				}
				if ($key == 'module_id') {
					$name = $this->Common_model->fetch_object(array('id' => $value), 'modules');
					$object->module_id = $name->name;
				}
				if ($key == 'active') {
					$status = 'Inactive';
					if ($value == 1) {
						$status = 'Active';
					}
					$object->status = $status;
					unset($object->active);
				}
				if ($key == 'latitude') {
					if ($value != '0.000000000000000') {
						$object->latitude = $value + 0;
					} else {
						$object->latitude = '';
					}
				}
				if ($key == 'longitude') {
					if ($value != '0.000000000000000') {
						$object->longitude = $value + 0;
					} else {
						$object->longitude = '';
					}
				}
				if ($key == 'status_change' && $value != '0000-00-00 00:00:00') {
					$object->status_change = date('m/d/Y h:i:sa', strtotime($value));
				} else {
					unset($object->status_change);
				}
				if ($key == 'created') {
					$object->created = date('m/d/Y h:i:sa', strtotime($value));
				}
				if ($key == 'created_by') {
					if ($create_name = $this->Common_model->fetch_object(array('id' => $value), 'users')) {
						$object->created_by	= $create_name->first_name . ' ' . $create_name->last_name;
					} else {
						$object->created_by	= 'Unknown';
					}	
				}
				if ($key == 'modified_by' && $value == '') {
					unset($object->modified_by);
					unset($object->modified);
				}
				if ($key == 'modified') {
					$object->modified = date('m/d/Y h:i:sa', strtotime($value));
				}
				if ($key == 'modified_by' && $value > 0) {
					$mod_name = $this->Common_model->fetch_object(array('id' => $value), 'users');
					$object->modified_by = $mod_name->first_name . ' ' . $mod_name->last_name;
				}
				if ($key == 'resolved_by' && $value == '') {
					unset($object->resolved_by);
					unset($object->resolved);
				}
				if ($key == 'resolved') {
					$object->resolved = date('m/d/Y h:i:sa', strtotime($value));
				}
				if ($key == 'resolved_by' && $value != '') {
					$res_name = $this->Common_model->fetch_object(array('id' => $value), 'users');
					$object->resolved_by = $res_name->first_name . ' ' . $res_name->last_name;
				}
				if ($key == 'email') {
					$object->email = '<a href="mailto:' . $value . '" class="item_link">';
				}
			}
		}
		return $object;
	}

	public function select_arrays($object)
	{
		if ($object == 'admin_log_columns') {
			$options[0]['value']	= 'object_name';
			$options[0]['display']	= 'Entity';
			$options[1]['value']	= 'table';
			$options[1]['display']	= 'Table';
			$options[2]['value']	= 'action';
			$options[2]['display']	= 'Action';
			$options[3]['value']	= 'description';
			$options[3]['display']	= 'Description';
			$options[4]['value']	= 'created_by';
			$options[4]['display']	= 'Created By';
			$options[5]['value']	= 'created';
			$options[5]['display']	= 'Created';
		} else if ($object == 'admin_log_actions') {
			$options[0]['value']	= 'LOGIN';
			$options[0]['display']	= 'LOGIN';
			$options[1]['value']	= 'INSERT';
			$options[1]['display']	= 'INSERT';
			$options[2]['value']	= 'UPDATE';
			$options[2]['display']	= 'UPDATE';
			$options[3]['value']	= 'DELETE';
			$options[3]['display']	= 'DELETE';
		}
			
		return $options;
	}

	public function clear_search()
	{
		if ($this->child == '/admin_log/clear_search') {
			unset($_SESSION['search']);
		}
	}

	public function prepare_column_values_array($objects, $column)
	{
		$array = array();
		foreach ($objects as $value) {
		}

		return $array;
	}

	public function ansi_dt($date, $border)
	{
		if ($border == 'end') {
			$timestamp = date('Y-m-d', strtotime($date)) . ' 23:59:59';
		} else if ($border == 'start') {
			$timestamp = date('Y-m-d', strtotime($date)) . ' 00:00:00';
		}

		return $timestamp;
	}

	public function plural_afy($text, $number)
	{
		if ($number == 0 || $number > 1) {
			if (substring($text) == 's') {
				$text = $text . "'";
			} else {
				$text = $text . "s";
			}
		}		

		return $text;
	}
	
	public function fetch_user_menu_perms($parent_id, $permissions, $menu_item)
	{
		$this->load->model('Group_permissions_model');
		$menu_perms = $this->Group_permissions_model->fetch_user_menu_perms($parent_id, $permissions);

		if (!empty($menu_perms)) {
			$menu_items = '<select class="common-input" id="menu_items">';
			$inc = 0;
			foreach ($menu_perms as $menu) {
				if ($menu->controller != '') {
					if ($menu->id == $menu_item) {
						$menu_items .= '<option value="/' .$menu->controller . '/' . $menu->method . '" selected>' . $menu->name . '</option>';
					} else {
						$menu_items .= '<option value="/' .$menu->controller . '/' . $menu->method . '">' . $menu->name . '</option>';
					}
					++$inc;
				}
			}
			$menu_items .= '</select>';

			return array('menu' => $menu_items, 'count' => $inc);
		}

		return false;
	}
}
