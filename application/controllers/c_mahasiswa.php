<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class C_mahasiswa extends CI_Controller {

    public function index(){
        $data['view'] = $this->m_mahasiswa->tampil();
        $this->load->view('v_datamahasiswa',$data);
    }

    public function tambah(){
        $this->load->view('v_tambah');
    }

    public function tambahdata(){
        $this->m_mahasiswa->tambah_data();
        redirect('c_mahasiswa/');
    }

    public function tampiledit($id_mahasiswa){
        $data['view'] = $this->m_mahasiswa->tampilubah($id_mahasiswa);
        $this->load->view('v_edit',$data);
    }

    public function editdata(){
        $this->m_mahasiswa->edit_data();
        redirect('c_mahasiswa');
    }
        
    public function hapus($id_mahasiswa){
        $this->m_mahasiswa->hapus($id_mahasiswa);
        redirect('c_mahasiswa');  
    }

}