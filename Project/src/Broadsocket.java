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

@ServerEndpoint("/broadcast")
public class Broadsocket {
	
	static String ten = "you";
	static boolean Boo_user_send = false;
	static int Int_user_send = 0;
	static int random = (int)(Math.random() * 100) +1;
	static HashMap<Session, Integer>  hmap = new HashMap<Session, Integer>();
	
	static int meltiroom = 0;
	

	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());
	@OnMessage
	public void onMessage(String message, Session session) throws IOException{
		System.out.println("Broadsocekt message11 = " +message);
		synchronized (clients) {
			for (Session client : clients) {
		if(Int_user_send == 1) {
			System.out.println("meltiroom =" + meltiroom);
			System.out.println("hmap.get(client) =" + hmap.get(client));
			if((meltiroom) == hmap.get(client)) {
				System.out.println("안녕하세요 =" + hmap.get(client));
			client.getBasicRemote().sendText(message+"");
			}
		}else {
			// Iterate over the connected sessions
			// and broadcast the received message
				if (!client.equals(session)) {
					if(hmap.get(session) == hmap.get(client)) {
					client.getBasicRemote().sendText(message);
					System.out.println("hmap.get(client) 2번쨰 if=" + hmap.get(client));
					//client.getBasicRemote().sendObject(ten);
					}
				}
			}
			//}
		}
			System.out.println("외부 Broadscoket.java Int =" + Int_user_send);
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
		if(ten == "my") {
		this.hmap.put(session, meltiroom);
		
		onMessage("you", session);
		this.Int_user_send ++;
		onMessage(random+"", session);
		this.Int_user_send = 0;
		System.out.println("hmmmmap11 = " + hmap.get(session));
		this.ten = "you";
		this.meltiroom++;
		}else if(ten == "you") {
			this.ten = "my";
		this.random = (int)(Math.random() * 100) +1;
		this.hmap.put(session, meltiroom);
		System.out.println("hmmmmap22= " + hmap.get(session));
		}
		System.out.println("Broadsocket map.size() = " + hmap.size());
	}

	@OnClose
	public void onClose(Session session) throws IOException {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
}