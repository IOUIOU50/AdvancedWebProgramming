package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class MemberDAO {
	private Connection conn; // connection:db에접근하게 해주는 객체
	private PreparedStatement pstmt;
	private ResultSet rs;
	// mysql에 접속해 주는 부분

	public MemberDAO() { // 생성자 실행될때마다 자동으로 db연결이 이루어 질 수 있도록함
		conn = new DBConnection("jsharing_integrated").connect();
	}
	
	// 로그인을 시도하는 함수****
	public int login(String userID, String userPassword) {
		String SQL = "SELECT user_id, user_pw FROM user WHERE user_id = ?";
		try {
			// pstmt : prepared statement 정해진 sql문장을 db에 삽입하는 형식으로 인스턴스가져옴
			pstmt = conn.prepareStatement(SQL);
			// sql인젝션 같은 해킹기법을 방어하는것... pstmt을 이용해 하나의 문장을 미리 준비해서(물음표사용)
			// 물음표해당하는 내용을 유저아이디로, 매개변수로 이용.. 1)존재하는지 2)비밀번호무엇인지
			pstmt.setString(1, userID);
			// rs:result set 에 결과보관
			
			rs = pstmt.executeQuery();
			// 결과가 존재한다면 실행
			if (rs.next()) {
				// 패스워드 일치한다면 실행
				if (rs.getString(1).equals(userPassword)) {
					return 1; // 라긴 성공
				} else
					return 0; // 비밀번호 불일치
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류를 의미
	}
}