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
	
	static String ten = "������ �ƴҶ��� ���� ���մϴ� !##!%%^&";
	static boolean Boo_user_send = false;
	static int Int_user_send = 0;
	static int random = (int)(Math.random() * 100) +1;
	static HashMap<Session, Integer>  hmap = new HashMap<Session, Integer>();
	
	static int meltiroom = 0;
	

	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());
	@OnMessage
	public void onMessage(String message, Session session) throws IOException{
		
		if(message.equals("���� �Լ� ���ֱ�")) {
			this.ten = "������ �ƴҶ��� ���� ���մϴ� !##!%%^&";
			this.Int_user_send=0;
			this.meltiroom--;
		}else {
		synchronized (clients) {
			for (Session client : clients) {
		if(Int_user_send == 1) {
		//	System.out.println("meltiroom =" + meltiroom);
		//	System.out.println("hmap.get(client) =" + hmap.get(client));
			if((meltiroom) == hmap.get(client)) {
			//	System.out.println("�ȳ��ϼ��� =" + hmap.get(client));
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
			//System.out.println("�ܺ� Broadscoket.java Int =" + Int_user_send);
	}
		}
}

	@OnOpen
	public void onOpen(Session session) throws IOException {
		// Add session to the connected sessions set
		//System.out.println("�������� java�Դϴ�." + i);
		//i++;
		clients.add(session);
		// ù��° ���� Ŭ���̾�Ʈ�� 1(����)�ǰ������� 2��° ����Ŭ�󽺴� 2(����)�� �����޴´�.
		// �������� ������ Ŭ���̾�Ʈ�� �������ٶ� �ڱ������ϰ� ���� ���ֱ⋚���̴�.
		if(ten == "�����Դϴ� $&*@&$*@$&*@$&@*") {
		this.hmap.put(session, meltiroom);
		onMessage("������ �ƴҶ��� ���� ���մϴ� !##!%%^&", session);
		this.Int_user_send ++;
		System.out.println("random =  " + random);
		onMessage(random+"", session);
		this.Int_user_send = 0;
		this.ten = "������ �ƴҶ��� ���� ���մϴ� !##!%%^&";
		this.meltiroom++;
		}else if(ten == "������ �ƴҶ��� ���� ���մϴ� !##!%%^&") {
			this.ten = "�����Դϴ� $&*@&$*@$&*@$&@*";
		this.random = (int)(Math.random() * 100) +1;
		this.hmap.put(session, meltiroom);
		}
	}

	@OnClose
	public void onClose(Session session) throws IOException {
		// Remove session from the connected sessions set
		System.out.println("�������������");
		clients.remove(session);
	}
}