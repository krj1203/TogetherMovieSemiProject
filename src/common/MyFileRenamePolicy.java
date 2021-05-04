package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{
	
	@Override
	public File rename(File originFile) {
		
		long currentTime = System.currentTimeMillis(); // 지금 시간을 밀리세컨즈까지 포함
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		
		// 확장자 가져오기
				String name = originFile.getName(); // 파일 명
				String ext = null; // 확장자 저장할 변수
				
				int dot = name.lastIndexOf("."); //  마지막  . 찾기 // 만약 확장자가 없는 파일이면 -1이 저장된다.
				if(dot != -1) {
					ext = name.substring(dot);
				} else {
					ext = "";
				}
				
				String fileName = sdf.format(new Date(currentTime)) + ranNum + ext; // 바꾼 이름
				File newFile = new File(originFile.getParent(), fileName); // getParent() : 원래있던 경로 반환
				
				return newFile;
	}
}
