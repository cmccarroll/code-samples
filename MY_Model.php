<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MY_Model extends CI_Model
{
	public $table;

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
		$this->table = strtolower(str_replace('_model', '', get_Class($this)));
	}

	public function save($data, $tablename="")
	{
		if($tablename == '')
		{
			$tablename = $this->table;
		}
		$op = 'update';
		$keyExists = FALSE;
		$fields = $this->db->field_data($tablename);
	
		foreach ($fields as $field)
		{
			if($field->primary_key == 1)
			{
				$keyExists = TRUE;
				if(isset($data[$field->name]))
				{
					$this->db->where($field->name, $data[$field->name]);
				
				} else {

					$op = 'insert';
				}
			}
		}
		if($keyExists && $op == 'update') {
			$this->db->set($data);
			$this->db->update($tablename);
			if($this->db->affected_rows() == 1)
			{
				return $this->db->affected_rows();
			}
		}
		$this->db->insert($tablename, $data);
		return $this->db->affected_rows();
	}

	public function count($conditions = null, $tablename)
	{
		$this->db->select('COUNT(*) rows', FALSE);
		$this->db->where($conditions);
		$query = $this->db->get($tablename);
		//print_r($query); die();
		
		return $query->row()->rows;
	}
	
	public function search($conditions = null, $tablename, $limit = 500, $offset = 0, $order_by = null, $list = null)
	{
		if($conditions != null)
		{
			if($list != NULL) {
				$this->db->select($list, FALSE);
			}
			if ($order_by != null) {
				$this->db->order_by($order_by);
			}
			$this->db->where($conditions);
			$query = $this->db->get($tablename, $limit, $offset);
			//print_r($query); die();

			return $query->result();
		}
	}

	public function fetch_object($conditions = null, $tablename, $list = null, $order_by = null)
	{
		if($conditions != NULL)
		{
			if($list != NULL) {
				$this->db->select($list, FALSE);
			}
			if ($order_by != null) {
				$this->db->order_by($order_by);
			}
			$this->db->where($conditions);
			$qry = $this->db->get($tablename, 1);
			//print_r($qry);

			return $qry->row();
		}
	}
	
	public function insert($data, $tablename)
	{
		$this->db->insert($tablename, $data);
		return $this->db->insert_id();
	}
	
	public function update($data, $conditions, $tablename)
	{
		$this->db->where($conditions);
		$this->db->update($tablename, $data);
		//print_r($this->db);
		return $this->db->affected_rows();
	}
	
	public function delete($conditions, $tablename)
	{
		$this->db->where($conditions);
		$this->db->delete($tablename);
		//print_r($conditions); die();
		return $this->db->affected_rows();
	}
}
