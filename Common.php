<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Common extends MY_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->is_authenticated();
	}

	/* ************************************************************************ */
	/* *** Add **************************************************************** */
	/* ************************************************************************ */
	public function add()
	{
		$id		= $this->uri->segment(3);
		$parent	= $this->uri->segment(4);
		$extra	= $this->uri->segment(5);
		switch($parent):
			/* *** Add Action ************************************************* */
			case 'actions':
				$conditions 	= array('active' => 1, 'tag_type' => 'action');
				$data['objects']= $this->Common_model->search($conditions, 'tags');
				$data['object'] = (object) [
					'name'			=> '',
					'xml_name'		=> '',
					'description'	=> '',
					'active'		=> 2,
				];
				$data['assigned_tags'] = array();
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Add Controller ********************************************* */
			case 'controllers':
				$conditions1	= array('active' => 1);
				$conditions2	= array('active' => 1, 'man_type' => 'Controller');
				$data['objects']		= $this->Common_model->search($conditions1, 'objects');
				$data['manufacturers']	= $this->Common_model->search($conditions2, 'manufacturers');
				$data['object']	= (object) [
					'name'			=> '',
					'xml_name'		=> '',
					'ip_address'	=> '',
					'description'	=> '',
					'active'		=> 2,
				];
				$data['assigned'] = array();
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Add Department ********************************************* */
			case 'departments':
				$conditions = array('active' => 1, 'account_id' => ACCOUNT_ID);
				$data['users']	= $this->Common_model->search($conditions, 'users');
				$data['object']	= (object) [
					'name'			=> '',
					'manager_id'	=> '',
					'active'		=> 2,
				];
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Add Device ************************************************* */
			case 'devices':
				$conditions = array('active' => 1);
				$data['executions']		= $this->Common_model->search($conditions, 'executions');
				$data['measurements']	= $this->Common_model->search($conditions, 'measurements');
				$data['triggers']		= $this->Common_model->search($conditions, 'triggers');
				$data['object']		= (object) [
					'name'			=> '',
					'xml_name'		=> '',
					'man_name'		=> '',
					'mod_name'		=> '',
					'description'	=> '',
					'active'		=> 2,
				];
				$data['assigned_executions']	= array();
				$data['assigned_measurements']	= array();
				$data['assigned_triggers']		= array();
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Add Execution ********************************************** */
			case 'executions':
				$conditions = array('active' => 1, 'tag_type' => 'execution');
				$data['objects']	= $this->Common_model->search($conditions, 'tags');
				$data['object']		= (object) [
					'name'			=> '',
					'xml_name'		=> '',
					'description'	=> '',
					'active'		=> 2,
				];
				$data['assigned'] = array();
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Add Group ************************************************** */
			case 'groups':
				$data['object']	= (object) [
					'name'			=> '',
					'description'	=> '',
					'active'		=> 2,
				];
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Add Manufacturer ******************************************* */
			case 'manufacturers':
				$data['object']	= (object) [
					'name'				=> '',
					'primary_contact'	=> '',
					'website'			=> '',
					'description'		=> '',
					'active'			=> 2,
				];
				$data['man_type'] = $extra;
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Add Manufacturer Model ************************************* */
			case 'models':
				$conditions = array('active' => 1, 'man_type' => $extra);
				$data['objects']= $this->Common_model->search($conditions, 'manufacturers');
				//print_r($data['objects']); die();
				$data['object']	= (object) [
					'name'				=> '',
					'description'		=> '',
					'active'			=> 2,
				];
				$data['assigned'] = array();
				$data['man_type'] = $extra;
				$this->load->view('/models/object_form', $data);
				break;
			/* *** Add Measurement ******************************************** */
			case 'measurements':
				$conditions = array('active' => 1, 'tag_type' => 'measurement');
				$data['objects']= $this->Common_model->search($conditions, 'tags');
				$data['object'] = (object) [
					'name'			=> '',
					'xml_name'		=> '',
					'description'	=> '',
					'units'			=> '',
					'threshold'		=> '',
					'active'		=> 2,
				];
				$data['assigned'] = array();
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Add Module ************************************************* */
			case 'modules':
				$data['object'] = (object) [
					'name'			=> '',
					'controller'	=> '',
					'method'		=> '',
					'order'			=> '',
					'active'		=> 2,
				];
				$list = 'order_by';
				$conditions = array('active' => 1, 'parent_id' => $id);
				$next = $this->Common_model->fetch_object($conditions, 'modules', $list, 'order_by DESC');
				if ($next) {
					$data['next_module'] = $next->order_by + 1;
				} else {
					$data['next_module'] = 1;
				}
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Add Model Image ******************************************** */
			case 'object_images':
				$data['object']	= (object) [
					'name'			=> '',
					'image_name'	=> '',
					'thumb_name'	=> '',
					'description'	=> '',
					'active'		=> 2,
				];
				$this->load->view('/objects/image_form', $data);
				break;
			/* *** Add Object ************************************************* */
			case 'objects':
				$conditions = array('active' => 1);
				$data['images']	= $this->Common_model->search($conditions, 'model_images');
				$data['objects']= $this->Common_model->search($conditions, 'devices');
				$data['object']	= (object) [
					'name'			=> '',
					'xml_name'		=> '',
					'man_name'		=> '',
					'mod_name'		=> '',
					'description'	=> '',
					'active'		=> 2,
				];
				$data['assigned'] = array();
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Add Site *************************************************** */
			case 'sites':
				$conditions = array('active' => 1);
				$data['objects'] = $this->Common_model->search($conditions, 'objects');
				$data['object'] = (object) [
					'name'			=> '',
					'xml_name'		=> '',
					'latitude'		=> '',
					'longitude'		=> '',
					'active'		=> 2,
				];
				$data['assigned'] = array();
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Add Site Objects ******************************************* */
			case 'site_objects':
				//echo $id;
				$conditions = array('active' => 1);
				$data['objects'] = $this->Common_model->search($conditions, 'objects');
				$this->load->view('/sites/add_site_objects', $data);
				break;
			/* *** Add Tag **************************************************** */
			case 'tags':
				$data['object'] = (object) [
					'name'			=> '',
					'xml_name'		=> '',
					'description'	=> '',
					'active'		=> 2,
				];
				for ($x = 0; $x < 4; $x++) {
					$type_sel[] = '';
				}
				$data['type_sel'] = $type_sel;
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Add Trigger ************************************************ */
			case 'triggers':
				$conditions1 = array('active' => 1);
				$conditions2 = array('active' => 1, 'tag_type' => 'trigger');
				$data['actions']			= $this->Common_model->search($conditions1, 'actions', '', '', 'name');
				$data['tags']				= $this->Common_model->search($conditions2, 'tags', '', '', 'name');
				$data['assigned_actions']	= array();
				$data['assigned_tags']		= array();
				$data['object'] = (object) [
					'name'			=> '',
					'xml_name'		=> '',
					'description'	=> '',
					'active'		=> 2,
				];
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Add User *************************************************** */
			case 'users':
				$data['disabled']	= '';
				$data['object'] = (object) [
					'first_name'=> '',
					'last_name'	=> '',
					'user_name'	=> '',
					'email'		=> '',
					'active'	=> 2,
				];
				$assigned_depts	= array();
				$assigned_groups= array();
				$data['departments']= $this->Common_model->search(array('active' => 1), 'departments');
				$data['groups']		= $this->Common_model->search(array('active' => 1), 'groups');
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
		endswitch;
	}

	/* ************************************************************************ */
	/* *** Details ************************************************************ */
	/* ************************************************************************ */
	public function details()
	{
		$id		= $this->uri->segment(3);
		$source	= $this->uri->segment(4);
		$table	= $source;

		//echo $id.' '.$source;
		if ($source == 'object_image') {
			$table = 'models';
		} else if ($source == 'site_objects') {
			$table = 'sites';
		} else if ($source == 'object_full_image') {
			$table = 'model_images';
		}
		//echo $table;
		$object = $this->Common_model->fetch_object(array('id' => $id), $table);
		//print_r($object);
		$data['object'] = $this->format_object_data($object);

		switch($source):
			/* *** Action Details ********************************************** */
			case 'actions':
				$this->load->model('Actions_model');
				$data['name']		= 'Action';
				$data['triggers']	= $this->Actions_model->fetch_parents($id);
				$data['tags']		= $this->Actions_model->fetch_tags($id);
				$this->load->view('/common/object_details', $data);
				break;
			/* *** Department Details ****************************************** */
			case 'departments':
				$this->load->model('Departments_model');
				$data['name']			= 'Department';
				$data['users']			= $this->Departments_model->fetch_users($id);
				$this->load->view('/common/object_details', $data);
				break;
			/* *** Device Details ********************************************** */
			case 'devices':
				$this->load->model('Device_measurements_model');
				$data['name']			= 'Device';
				$data['measurements']	= $this->Device_measurements_model->fetch_device_measurements($id);
				$this->load->view('/common/object_details', $data);
				break;
			/* *** Execution Details ******************************************* */
			case 'executions':
				$this->load->model('Executions_model');
				$data['name']		= 'Execution';
				$data['tags']		= $this->Executions_model->fetch_parents($id, 'full');
				$this->load->view('/common/object_details', $data);
				break;
			/* *** Group Details *********************************************** */
			case 'groups':
				$this->load->model('Groups_model');
				$data['name']		= 'Group';
				$data['users']		= $this->Groups_model->fetch_users($id);
				$this->load->view('/common/object_details', $data);
				break;
			/* *** Manufacturer Details **************************************** */
			case 'manufacturers':
				$data['name']		= $object->man_type . ' Manufacturer';
				$this->load->view('/common/object_details', $data);
				break;
			/* *** Measurement Details ***************************************** */
			case 'measurements':
				$this->load->model('Measurement_tags_model');
				$data['name']		= 'Measurement';
				$data['devices']	= $this->Measurement_tags_model->fetch_measurement_tags($id, 'full');
				$this->load->view('/common/object_details', $data);
				break;
			/* *** Module Details ********************************************** */
			case 'modules':
				$this->load->model('Modules_model');
				$data['name']		= 'Module';
				$data['sub_mods']	= $this->Modules_model->fetch_relatives($id, 'full');
				$this->load->view('/common/object_details', $data);
				break;
			/* *** Model Details *********************************************** */
			case 'models':
				//$this->load->model('Models_model');
				$data['name']		= 'Model';
				//$data['sub_mods']	= $this->Mode's_model->fetch_relatives($id, 'full');
				$this->load->view('/common/object_details', $data);
				break;
			/* *** Model Image Details ***************************************** */
			case 'object_images':
				$data['name']		= 'Object Image';
				$this->load->view('/common/object_details', $data);
				break;
			/* *** Model Full Image Details ************************************ */
			case 'object_full_image':
				$this->load->model('Objects_model');
				$data['image']		= $this->Objects_model->fetch_image($id);
				$this->load->view('/common/object_image', $data);
				break;
			/* *** Model Image Details ***************************************** */
			case 'object_image':
				$this->load->model('Objects_model');
				$data['image']		= $this->Objects_model->fetch_image($id);
				$this->load->view('/common/object_image', $data);
				break;
			/* *** Object Details ********************************************** */
			case 'objects':
				$this->load->model('Objects_model');
				$data['name']		= 'Object';
				//$data['sites']	= $this->Objects_model->fetch_parents($id);
				$data['devices']	= $this->Objects_model->fetch_devices($id);
				$this->load->view('/common/object_details', $data);
				break;
			/* *** Site Details ************************************************ */
			case 'sites':
				$data['name']		= 'Site';
				$this->load->view('/common/object_details', $data);
				break;
			/* *** Site Object Details ***************************************** */
			case 'site_objects':
				$this->load->model('Sites_model');
				$data['name']		= 'Site';
				$data['site_id']	= $object->id;
				$data['images']		= $this->Sites_model->fetch_images($id);
				$data['objects']	= $this->Common_model->search(array('id' => $id), 'objects');
				$this->load->view('/common/site_hover_details', $data);
				break;
			/* *** Tag Details ************************************************* */
			case 'tags':
				$data['name']		= 'Tag';
				$this->load->view('/common/object_details', $data);
				break;
			/* *** Ticket Details ********************************************** */
			case 'tickets':
				$data['name']		= 'Ticket';
				$this->load->view('/common/object_details', $data);
				break;
			/* *** Trigger Details ********************************************* */
			case 'triggers':
				$data['name']		= 'Trigger';
				$this->load->view('/common/object_details', $data);
				break;
			/* *** User Details ************************************************ */
			case 'users':
				$this->load->model('User_departments_model');
				$this->load->model('User_groups_model');
				$data['name']		= 'User';
				$data['departments']= $this->User_departments_model->fetch_user_departments($id, 'full');
				$data['groups'] 	= $this->User_groups_model->fetch_user_groups($id, 'full');
				$this->load->view('/common/object_details', $data);
				break;
			default:
				$page 				= 'object_details';
				$data['name']		= $object->name;
		endswitch;
	}

	/* ************************************************************************ */
	/* *** Edit *************************************************************** */
	/* ************************************************************************ */
	public function edit()
	{
		$id		= $this->uri->segment(3);
		$parent	= $this->uri->segment(4);

		$object = $this->Common_model->fetch_object(array('id' => $id), $parent);

		$act_sel[0] = '';
		$act_sel[1] = '';
		if (isset($object->active)) {
			if ($object->active == 1) {
				$act_sel[0] = 'selected';
			} else {
				$act_sel[1] = 'selected';
			}
		}

		$disabled = '';
		if ($parent == 'user') {
			if ($object->user_name == 'admin') {
				$disabled = 'disabled';
			}
		}

		$data['id'] 		= $id;
		$data['act_sel']	= $act_sel;
		$data['disabled']	= $disabled;
		$data['object']		= $object;

		switch($parent):
			/* *** Edit Action ************************************************ */
			case 'actions':
				$conditions 	= array('active' => 1, 'tag_type' => 'action');
				$data['objects']= $this->Common_model->search($conditions, 'tags');
				$assn_tags		= $this->Common_model->search(array('action_id' => $id), 'action_tags');
				$assigned_tags	= array();
				foreach ($assn_tags as $object) {
					$assigned_tags[] = $object->tag_id;
				}
				$data['assigned_tags']	= $assigned_tags;
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Edit Controller ******************************************** */
			case 'controllers':
				$conditions = array('active' => 1, 'account_id' => ACCOUNT_ID);
				$data['users'] = $this->Common_model->search($conditions, 'users');
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Edit Department ******************************************** */
			case 'departments':
				$conditions = array('active' => 1, 'account_id' => ACCOUNT_ID);
				$data['users'] = $this->Common_model->search($conditions, 'users');
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Edit Device ************************************************ */
			case 'devices':
				$conditions = array('active' => 1);
				$data['executions']				= $this->Common_model->search($conditions, 'executions');
				$data['measurements']			= $this->Common_model->search($conditions, 'measurements');
				$data['triggers']				= $this->Common_model->search($conditions, 'triggers');
				$assn_executions				= $this->Common_model->search(array('device_id' => $id), 'device_executions');
				$assn_measurements				= $this->Common_model->search(array('device_id' => $id), 'device_measurements');
				$assn_triggers					= $this->Common_model->search(array('device_id' => $id), 'device_triggers');
				$assigned_executions	= array();
				$assigned_measurements	= array();
				$assigned_triggers		= array();
				foreach ($assn_executions as $object) {
					$assigned_executions[] = $object->execution_id;
				}
				foreach ($assn_measurements as $object) {
					$assigned_measurements[] = $object->measurement_id;
				}
				foreach ($assn_triggers as $object) {
					$assigned_triggers[] = $object->trigger_id;
				}
				//print_r($this->prepare_column_values_array($assigned_measurements, 'measurement_id')); die();
				$data['assigned_executions']	= $assigned_executions;
				$data['assigned_measurements']	= $assigned_measurements;
				$data['assigned_triggers']		= $assigned_triggers;
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Edit Execution ********************************************* */
			case 'executions':
				$conditions = array('active' => 1, 'tag_type' => 'execution');
				$data['objects']	= $this->Common_model->search($conditions, 'tags');
				$assigned_objects	= $this->Common_model->search(array('execution_id' => $id), 'execution_tags');
				$assigned = array();
				foreach ($assigned_objects as $object) {
					$assigned[] = $object->tag_id;
				}
				$data['assigned']= $assigned;
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Edit Group ************************************************* */
			case 'groups':
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Edit Manufacturer ****************************************** */
			case 'manufacturers':
				$data['man_type'] = $object->man_type;
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Edit Measurement ******************************************* */
			case 'measurements':
				$conditions = array('active' => 1, 'tag_type' => 'measurment');
				$data['objects']	= $this->Common_model->search($conditions, 'tags');
				$assigned_objects	= $this->Common_model->search(array('measurement_id' => $id), 'measurement_tags');
				$assigned = array();
				foreach ($assigned_objects as $object) {
					$assigned[] = $object->tag_id;
				}
				$data['assigned']= $assigned;
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Edit Module ************************************************ */
			case 'modules':
				$data['next_module'] = '';
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Edit Object ************************************************ */
			case 'objects':
				$conditions		= array('active' => 1);
				$data['objects']= $this->Common_model->search($conditions, 'devices');
				$data['images']	= $this->Common_model->search($conditions, 'model_images');
				$assigned_objects	= $this->Common_model->search(array('object_id' => $id), 'object_devices');
				$assigned = array();
				foreach ($assigned_objects as $object) {
					$assigned[] = $object->device_id;
				}
				$data['assigned'] = $assigned;
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Edit Site ************************************************** */
			case 'sites':
				$conditions = array('active' => 1);
				$data['objects']	= $this->Common_model->search($conditions, 'objects');
				$assigned_objects	= $this->Common_model->search(array('site_id' => $id), 'site_objects');
				$assigned = array();
				foreach ($assigned_objects as $object) {
					$assigned[] = $object->object_id;
				}
				$data['assigned'] = $assigned;
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Edit Tag *************************************************** */
			case 'tags':
				for ($x = 0; $x < 4; $x++) {
					$type_sel[] = '';
				}
				if ($object->tag_type == 'action') {
					$type_sel[0] = 'selected';
				} else if ($object->tag_type == 'execution') {
					$type_sel[1] = 'selected';
				} else if ($object->tag_type == 'measurement') {
					$type_sel[2] = 'selected';
				} else if ($object->tag_type == 'trigger') {
					$type_sel[3] = 'selected';
				}
				$data['type_sel'] = $type_sel;
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Edit Trigger *********************************************** */
			case 'triggers':
				$conditions1 		= array('active' => 1);
				$conditions2 		= array('active' => 1, 'tag_type' => 'trigger');
				$data['actions']	= $this->Common_model->search($conditions1, 'actions');
				$data['tags']		= $this->Common_model->search($conditions2, 'tags');
				$assn_acts			= $this->Common_model->search(array('trigger_id' => $id), 'trigger_actions');
				$assn_tags			= $this->Common_model->search(array('trigger_id' => $id), 'trigger_tags');
				$assigned_actions	= array();
				$assigned_tags		= array();
				foreach ($assn_acts as $object) {
					$assigned_actions[] = $object->action_id;
				}
				foreach ($assn_tags as $object) {
					$assigned_tags[] = $object->tag_id;
				}
				$data['assigned_actions']	= $assigned_actions;
				$data['assigned_tags']		= $assigned_tags;
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
			/* *** Edit User ************************************************** */
			case 'users':
				$data['departments']= $this->Common_model->search(array('active' => 1), 'departments');
				$data['groups']		= $this->Common_model->search(array('active' => 1), 'groups');
				$this->load->view('/' . $parent . '/object_form', $data);
				break;
		endswitch;
	}

	/* ************************************************************************ */
	/* *** Object relatives *************************************************** */
	/* ************************************************************************ */
	public function object_relatives()
	{
		$id		= $this->uri->segment(3);
		$parent	= $this->uri->segment(4);
		$child	= $this->uri->segment(5);

		$model = ucfirst($parent) . '_model';
		$this->load->model($model);

		switch($parent):
			/* *** Action Relatives ******************************************* */
			case 'actions':
				$this->load->model('Triggers_model');
				$data['tags']			= $this->$model->fetch_tags($id);
				$data['triggers']		= $this->$model->fetch_parents($id);
				$this->load->view('/' . $parent . '/object_children', $data);
				break;
			/* *** Department Relatives *************************************** */
			case 'departments':
				$data['objects']	= $this->$model->fetch_users($id);
				$this->load->view('/' . $parent . '/object_children', $data);
				break;
			/* *** Device Relatives ******************************************* */
			case 'devices':
				$data['parents']	= $this->$model->fetch_parents($id);
				$data['para_count'] = 'object';
				if (count($data['parents']) > 1) {
					$data['para_count'] = 'objects';
				}
				$data['executions']		= $this->$model->fetch_executions($id);
				$data['exec_count'] 	= 'execution';
				if (count($data['executions']) > 1) {
					$data['exec_count'] = 'executions';
				}
				$data['measurements']	= $this->$model->fetch_measurements($id);
				$data['meas_count'] 	= 'measurement';
				if (count($data['measurements']) > 1) {
					$data['meas_count'] = 'measurements';
				}
				$data['triggers']		= $this->$model->fetch_triggers($id);
				$data['trig_count'] 	= 'trigger';
				if (count($data['triggers']) > 1) {
					$data['trig_count'] = 'triggers';
				}
				$this->load->view('/' . $parent . '/object_children', $data);
				break;
			/* *** Execution Relatives **************************************** */
			case 'executions':
				$data['devices']		= $this->Executions_model->fetch_parents($id);
				$data['objects']		= $this->$model->fetch_tags($id);
				$data['para_count']		= 'device';
				if (count($data['devices']) > 1) {
					$data['para_count']	= 'devices';
				}
				$data['tag_count']		= 'tag';
				if (count($data['objects']) > 1) {
					$data['tag_count']	= 'tags';
				}
				$this->load->view('/' . $parent . '/object_children', $data);
				break;
			/* *** Group Relatives ******************************************** */
			case 'groups':
				$data['objects']	= $this->$model->fetch_users($id);
				$this->load->view('/' . $parent . '/object_children', $data);
				break;
			/* *** Manufacturer Relatives ************************************* */
			case 'manufacturers':
				$data['objects']		= $this->$model->fetch_models_by_man_id($id);
				$data['model_count'] 	= 'model';
				if (count($data['objects']) > 1) {
					$data['model_count']= 'models';
				}
				$this->load->view('/' . $parent . '/object_children', $data);
				break;
			/* *** Measurement Relatives ************************************** */
			case 'measurements':
				$data['objects']		= $this->$model->fetch_tags($id);
				$data['devices']		= $this->$model->fetch_parents($id);
				$data['para_count'] 	= 'device';
				if (count($data['devices']) > 1) {
					$data['para_count'] = 'devices';
				}
				$data['tag_count'] 	= 'tag';
				if (count($data['objects']) > 1) {
					$data['tag_count'] = 'tags';
				}
				$this->load->view('/' . $parent . '/object_children', $data);
				break;
			/* *** Module Relatives ******************************************* */
			case 'modules':
				$data['objects']		= $this->$model->fetch_relatives($id);
				$this->load->view('/' . $parent . '/object_children', $data);
				break;
			/* *** Object Relatives ******************************************* */
			case 'objects':
				$data['parents']		= $this->$model->fetch_parents($id);
				$data['devices']		= $this->$model->fetch_devices($id);
				$data['para_count'] 	= 'site';
				if (count($data['parents']) > 1) {
					$data['para_count'] = 'sites';
				}
				$data['devs_count'] 	= 'device';
				if (count($data['parents']) > 1) {
					$data['devs_count'] = 'devices';
				}
				$this->load->view('/' . $parent . '/object_children', $data);
				break;
			/* *** Site Relatives ********************************************* */
			case 'sites':
				$data['objects']		= $this->$model->fetch_objects($id);
				$data['object_count'] 	= 'object';
				if (count($data['objects']) > 1) {
					$data['object_count'] = 'objects';
				}
				$this->load->view('/' . $parent . '/object_children', $data);
				break;
			/* *** Trigger Relatives ****************************************** */
			case 'triggers':
				$data['actions']		= $this->$model->fetch_actions($id);
				$data['objects']		= $this->$model->fetch_tags($id);
				$data['devices']		= $this->$model->fetch_parents($id);
				$data['parent_count'] 	= 'device';
				if (count($data['devices']) > 1) {
					$data['parent_count'] = 'devices';
				}
				$data['action_count'] 	= 'action';
				if (count($data['actions']) > 1) {
					$data['action_count'] = 'actions';
				}
				$data['tag_count'] 	= 'tag';
				if (count($data['objects']) > 1) {
					$data['tag_count'] = 'tags';
				}
				$this->load->view('/' . $parent . '/object_children', $data);
				break;
			/* *** User Department Relatives ********************************** */
			case 'user_departments':
				$data['objects']= $this->Common_model->search(array('active' => 1, 'account_id' => ACCOUNT_ID), $child);
				$assn_objects	= $this->Common_model->search(array('user_id' => $id), $parent);
				$assigned_objects = array();
				foreach ($assn_objects as $object) {
					$assigned_objects[] = $object->department_id;
				}
				$data['name']		= ucfirst($child);
				$data['assigned']	= $assigned_objects;
				$this->load->view('/users/object_children', $data);
				break;
			/* *** User Group Relatives *************************************** */
			case 'user_groups':
				$data['objects']= $this->Common_model->search(array('active' => 1, 'account_id' => ACCOUNT_ID), $child);
				$assn_objects	= $this->Common_model->search(array('user_id' => $id), $parent);
				$assigned_objects = array();
				foreach ($assn_objects as $object) {
					$assigned_objects[] = $object->group_id;
				}
				$data['name']		= ucfirst($child);
				$data['assigned']	= $assigned_objects;
				$this->load->view('/users/object_children', $data);
				break;
			default:
				//$data['objects'] = $this->$model->fetch_relatives($id);
		endswitch;
	}

	/* ************************************************************************ */
	/* *** Group permissions ************************************************** */
	/* ************************************************************************ */
	public function group_permissions()
	{
		$id		= $this->uri->segment(3);
		$list	= 'module_id';
		$permissions = $this->Common_model->search(array('group_id' => $id), 'group_permissions', '', '', '', $list);
		$selected = array();
		foreach ($permissions as $object) {
			$selected[] = $object->module_id;
		}
		if (USER_ID == 1) {
			$conditions	= "active = 1 AND parent_id = 0";
		} else {
			$conditions	= "active = 1 AND parent_id = 0 AND super_user = 0";
		}
		$modules = $this->Common_model->search($conditions, 'modules', '', '', 'order_by');
		$modules_display = '';
		foreach ($modules as $object) {
			$parent_chk = '';
			if (in_array($object->id, $selected)) {
				$parent_chk = 'checked';
			}
			$modules_display .= '<tr>';
			$modules_display .= '<td class="left"><input type="checkbox" name="module" class="parent_module" id="object_' . $object->id . '" value="' . $object->id . '" ' . $parent_chk . '/></td>';
			$modules_display .= '<td class="left" style="padding-right: 10px" nowrap>';
			$modules_display .= '<label for="object_' . $object->id . '" class="contrast_text parent_module" id="select_' . $object->id . '">';
			$modules_display .= $object->name . '</label></td>';
	
			$conditions1	= "active = 1 AND parent_id = " . $object->id;
			$children1 = $this->Common_model->search($conditions1, 'modules', '', '', 'order_by');
			/* *** First Child **************************************************************** */
			if (count($children1) > 0) {
				$modules_display .= '</tr><tr class="child_' . $object->id . '">';
				$modules_display .= '<td>&nbsp;</td>';
				$modules_display .= '<td><table class="collapse">';
				foreach ($children1 as $child1) {
					if ($child1->super_user != 1 || USER_ID == 1) {
						$child1_chk = '';
						if (in_array($child1->id, $selected)) {
							$child1_chk = 'checked';
						}
						$modules_display .= '<tr>';
						$modules_display .= '<td class="left"><input type="checkbox" name="module" class="child_' . $object->id . ' child_module" id="object_' . $child1->id . '" value="' . $child1->id . '" ' . $child1_chk . ' /></td>';
						$modules_display .= '<td class="left" style="padding-right: 10px" nowrap>';
						$modules_display .= '<label for="object_' . $child1->id . '" class="contrast_text child_module" id="select_' . $child1->id . '">';
						$modules_display .= $child1->name . '</label></td>';
						/* *** Second Child *************************************************** */
						$conditions2	= "active = 1 AND parent_id = " . $child1->id;
						$children2 = $this->Common_model->search($conditions2, 'modules', '', '', 'order_by');
						if (count($children2) > 0) {
							$modules_display .= '</tr><tr class="child_' . $child1->id . '">';
							$modules_display .= '<td>&nbsp;</td>';
							$modules_display .= '<td><table class="collapse">';
							foreach ($children2 as $child2) {
								$child2_chk = '';
								if (in_array($child2->id, $selected)) {
									$child2_chk = 'checked';
								}
								$modules_display .= '<tr>';
								$modules_display .= '<td class="left"><input type="checkbox" name="module" class="child_' . $object->id . ' child_' . $child1->id . '" id="object_' . $child2->id . '" value="' . $child2->id . '" ' . $child2_chk . ' /></td>';
								$modules_display .= '<td class="left" style="padding-right: 10px" nowrap>';
								$modules_display .= '<label for="object_' . $child2->id . '" class="contrast_text">';
								$modules_display .= $child2->name . '</label></td>';
								/* *** Third Child *************************************************** */ 
								$conditions3	= "active = 1 AND parent_id = " . $child2->id;
								$children3 = $this->Common_model->search($conditions3, 'modules', '', '', 'order_by');
								if (count($children3) > 0) {
									$modules_display .= '</tr><tr class="child_' . $child1->id . '">';
									$modules_display .= '<td>&nbsp;</td>';
									$modules_display .= '<td><table class="collapse">';
									foreach ($children3 as $child3) {
										$child3_chk = '';
										if (in_array($child3->id, $selected)) {
											$child3_chk = 'checked';
										}
										$modules_display .= '<tr>';
										$modules_display .= '<td class="left"><input type="checkbox" name="module" class="child_' . $object->id . ' child_' . $child1->id . '" id="object_' . $child3->id . '" value="' . $child3->id . '" ' . $child3_chk . ' /></td>';
										$modules_display .= '<td class="left" style="padding-right: 10px" nowrap>';
										$modules_display .= '<label for="object_' . $child3->id . '" class="contrast_text">';
										$modules_display .= $child3->name . '</label></td>';
									}
									$modules_display .= '</tr></table></td>';
								}
							}
							$modules_display .= '</tr></table></td>';
						}
					}
				}
				$modules_display .= '</tr></table></td>';
			}
		}
		$data['object']	= $this->Common_model->fetch_object(array('id' => $id), 'groups');
		$data['modules']= $modules_display; 
		$this->load->view('/groups/group_permissions', $data);
	}
}

