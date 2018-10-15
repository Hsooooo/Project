import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import oracle.net.aso.r;

@ServerEndpoint("/broadcast")
public class Broadsocket {
	
	static String ten = "내턴이 아닐때는 내가 못합니다 !##!%%^&";
	static boolean Boo_user_send = false;
	static int Int_user_send = 0;
	static int random = (int)(Math.random() * 100) +1;
	static HashMap<Session, Integer>  hmap = new HashMap<Session, Integer>();
	
	static int meltiroom = 0;
	

	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());
	@OnMessage
	public void onMessage(String message, Session session) throws IOException{
		
		if(message.equals("대기실 함수 없애기")) {
			this.ten = "내턴이 아닐때는 내가 못합니다 !##!%%^&";
			this.Int_user_send=0;
			this.meltiroom--;
		}else {
		synchronized (clients) {
			for (Session client : clients) {
		if(Int_user_send == 1) {
		//	System.out.println("meltiroom =" + meltiroom);
		//	System.out.println("hmap.get(client) =" + hmap.get(client));
			if((meltiroom) == hmap.get(client)) {
			//	System.out.println("안녕하세요 =" + hmap.get(client));
			client.getBasicRemote().sendText(message+"");
			}
		}else {
				if (!client.equals(session)) {
					if(hmap.get(session) == hmap.get(client)) {
					client.getBasicRemote().sendText(message);
					}
				}
			}
			//}
		}
			//System.out.println("외부 Broadscoket.java Int =" + Int_user_send);
	}
		}
}

	@OnOpen
	public void onOpen(Session session) throws IOException {
		// Add session to the connected sessions set
		//System.out.println("들어오세요 java입니다." + i);
		//i++;
		clients.add(session);
		// 첫번째 들어온 클라이언트는 1(선턴)의값을갖고 2번째 들어온클라스는 2(후턴)의 값을받는다.
		// 그이유는 서버가 클라이언트에 값을쏴줄때 자기제외하고 값을 쏴주기떄문이다.
		if(ten == "내턴입니다 $&*@&$*@$&*@$&@*") {
		this.hmap.put(session, meltiroom);
		onMessage("내턴이 아닐때는 내가 못합니다 !##!%%^&", session);
		this.Int_user_send ++;
		System.out.println("random =  " + random);
		onMessage(random+"", session);
		this.Int_user_send = 0;
		this.ten = "내턴이 아닐때는 내가 못합니다 !##!%%^&";
		this.meltiroom++;
		}else if(ten == "내턴이 아닐때는 내가 못합니다 !##!%%^&") {
			this.ten = "내턴입니다 $&*@&$*@$&*@$&@*";
		this.random = (int)(Math.random() * 100) +1;
		this.hmap.put(session, meltiroom);
		}
	}

	@OnClose
	public void onClose(Session session) throws IOException {
		// Remove session from the connected sessions set
		System.out.println("언제사라지는지");
		clients.remove(session);
	}
}