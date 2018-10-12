
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

@ServerEndpoint("/broadcastin")
public class Broadsocket {
	
	String ten = "1";

	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session, boolean ten) throws IOException, EncodeException {
		System.out.println("1");
		System.out.println("Broadsocekt message = " +message);
		System.out.println("Broadsocekt ten = " + ten);
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendObject(ten);
					//client.getBasicRemote().sendObject(ten);
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) throws IOException {
		// Add session to the connected sessions set
		//System.out.println("들어오세요 java입니다." + i);
		//i++;
		if(ten == "1") {
		System.out.println("if ten 111= " + ten);
		ten = "2";
		}else if(ten == "2") {
			System.out.println("else if ten = " + ten);
			ten = "1";
		}
		
		//System.out.println("onOpen =  ??"+session);
			clients.add(session);
		/*	if(ten == true) {
			onMessage(null, session, true);
			ten = false;
			}else if(ten == false) {
			onMessage(null, session, false);
			ten =true;
			}*/
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
}