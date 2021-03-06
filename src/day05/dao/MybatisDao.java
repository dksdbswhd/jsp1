package day05.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import day03.dto.Customer;
import day05.mybatis.SqlSessionBean;

public class MybatisDao {

	private static MybatisDao dao = new MybatisDao();
	private MybatisDao() { }
	public static MybatisDao getInstance() {
		return dao; 
	}
	
	//1.새로운 코딩 : 가장 중요한것은 SqlSession 객체를 생성해야한다. → 메소드에 SqlSessionFactory 객체 가져오기
	SqlSessionFactory sqlFactory = SqlSessionBean.getSessionFactory();
	
	public List<Customer> selectAll(){
		List<Customer> list = null;
	//2. SqlSession 객체 생성하여 sql 실행하기.
		SqlSession mapper = sqlFactory.openSession();
		list = mapper.selectList("selectAll");	//"selectAll" mapper 파일의 id값과 일치해야 한다.
				// 		 ㄴ 이 메소드는 리턴타입이 List<Object>, select 조회결과가 n개 row일때
		mapper.close();
		return list;
	}
	
	public Customer select(int idx) {
		Customer cus = null;
		SqlSession mapper = sqlFactory.openSession();
		cus = mapper.selectOne("selectOne", idx);	//두번째 인자는 sql실행에 필요한 파라미터.
				//		 ㄴ 이 메소드는 리턴타입이 Object, select 조회결과가 1row일때
		mapper.close();
		return cus;
	}
	
	public int insert(Customer cus) {
		//SqlSession mapper = sqlFactory.openSession(true);	//auto commit 을 true, 기본값 false
		SqlSession mapper = sqlFactory.openSession();
		int n = mapper.insert("insert",cus);	//auto commit? n값 확인? 정상 insert 이면 1
		mapper.commit();
		mapper.close();
		return n;
	}
	
	public int delete(int idx) {
		SqlSession mapper = sqlFactory.openSession();
		int n = mapper.delete("delete", idx);
		mapper.commit();
		mapper.close();
		return n;
	}
	
	public int update(Customer cus) {
		SqlSession mapper = sqlFactory.openSession();
		int n=mapper.update("update", cus);
		mapper.commit();
		mapper.close();
		return n;
	}
	//결론 insert, update, delete 는 return 값이 있다. → 실행한 결과 행의 갯수
}
