package client.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import crypt.BCrypt;

import client.dto.ClientDTO;
import sqlmap.MybatisManager;


public class ClientDAO {
	
	public List<ClientDTO> clientList(Map<String, Integer> map) {
		List<ClientDTO> list = null;
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			list = session.selectList("client.list", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}
	public String loginCheck(ClientDTO dto) {
		String name = "";
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			name = session.selectOne("client.loginCheck", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
		return name;	
	 }
	
	
	public ClientDTO view(String userid) {
		SqlSession session=MybatisManager.getInstance().openSession();
		ClientDTO dto=session.selectOne("client.view", userid);
		session.close();
		return dto;
	}
	
	public void insert(ClientDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("client.insert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
	}

	public void update(ClientDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("client.update", dto);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
	
	public void delete(String userid) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("client.delete", userid);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}

	

	public String idCheck(ClientDTO dto) {
		SqlSession session = null;
		String userid = "";
		
		try {
			session = MybatisManager.getInstance().openSession();
			userid = session.selectOne("client.idCheck", dto);
			
			if(userid == null) {
				userid = "";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return userid;
	}

	public String passwdCheck(ClientDTO dto) {
		SqlSession session = null;
		String userid = "";
		
		try {
			session = MybatisManager.getInstance().openSession();
			userid = session.selectOne("client.passwdCheck", dto);
			
			if(userid == null) {
				userid = "";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return userid;
	}

	public void updatePasswd(ClientDTO dto) {
		SqlSession session = null;
		
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("client.updatePasswd", dto);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
		
}
