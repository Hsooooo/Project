package WebSocket;

import java.io.IOException;
import java.util.Collections;
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
	
	static String ten = "2";
	static boolean Boo_user_send = false;
	static int Int_user_send = 0;
	static int random = (int)(Math.random() * 100) +1;

	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session) throws IOException{
		System.out.println("Broadsocekt message11 = " +message);
		synchronized (clients) {
			//int ii = (int)(Math.random() * 100)+1;
			//System.out.println("ii = " + ii);
			for (Session client : clients) {
		
		if(Int_user_send == 1) {
			client.getBasicRemote().sendText(random+"");
			
				
		}else {
			// Iterate over the connected sessions
			// and broadcast the received message
				if (!client.equals(session)) {
				
					client.getBasicRemote().sendText(message);
					//client.getBasicRemote().sendObject(ten);
					System.out.println("Broadscoket.java Int =" + Int_user_send);
				}
			}
			//}
		}
			Int_user_send ++;
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
		if(ten == "1") {
		//System.out.println("if ten = " + ten);
		onMessage("2", session);
		onMessage("3", session);
		this.ten = "2";
		this.Int_user_send = 0;
		this.random = (int)(Math.random() * 100) +1;
		}else if(ten == "2") {
		//	System.out.println("else if ten = " + ten);
	//	onMessage("1", session);
			this.ten = "1";
		}
		//System.out.println("onOpen =  ??"+session);
			
		/*	if(ten == true) {
			onMessage(null, session, true);
			ten = false;
			}else if(ten == false) {
			onMessage(null, session, false);
			ten =true;
			}*/
	}

	@OnClose
	public void onClose(Session session) throws IOException {
		// Remove session from the connected sessions set
		clients.remove(session);
		session.close();
	}
}