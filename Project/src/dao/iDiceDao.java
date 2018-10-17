package dao;

import dto.DiceDto;

public interface iDiceDao {
<<<<<<< HEAD

	public boolean diceAdd(String id, int curpoint); 
	// 1. login.jsp(í˜„ìž¬)ë‚˜ ë©”ì¸ì—ì„œ ì£¼ì‚¬ìœ„ë¡œ ë„˜ì–´ê°ˆ ë•Œ member í…Œì´ë¸”ì˜ idì™€ pointë¥¼ diceInit.jspë¡œ ë³´ëƒ„ -> idì™€ point ë°›ì•„ì„œ dice í…Œì´ë¸”ì— insert or updateí•¨.
	// 2. ë² íŒ… ë²„íŠ¼ (1) insert or update. ê²Œìž„ ì²«íŒì¼ ë•Œë§Œ ìƒˆ ë ˆì½”ë“œ ìƒì„±-ì´ë¯¸ Initì—ì„œ ë§Œë“¤ì–´ì ¸ì„œ ë„˜ì–´ì˜¤ë¯€ë¡œ, ì´ë¯¸ ì¡´ìž¬í•˜ëŠ” ê²½ìš° curpointë§Œ ì—…ë°ì´íŠ¸ë¨. 

	public boolean diceBet(String id, int bet); // ë² íŒ… ë²„íŠ¼ (2) update. curpointì—ì„œ betpoint ì°¨ê° + bet í•­ëª© ì—…ë°ì´íŠ¸
	
	public boolean diceAf(String id, int win, int lose, int earned); // roll ë²„íŠ¼ update. íšŒì°¨ ì¢…ë£Œ í›„  ê²°ê³¼  ì—…ë°ì´íŠ¸ìš©
	
	public DiceDto reDice(String id); // ê²Œìž„ ë·° ìƒˆë¡œê³ ì¹¨ or reset ë²„íŠ¼ í´ë¦­ì‹œ í˜„ìž¬ ê°€ìš© í¬ì¸íŠ¸ ê°±ì‹ ìš©.
	

	///+ BET, WIN, LOSE, EARNED ê¸ˆì•¡ ëˆ„ì ë˜ê²Œ ë°”ê¿ˆ
=======
	public boolean diceAdd(String id, int curpoint); //  º£ÆÃ ¹öÆ° ´©¸£¸é (1) merge. °ÔÀÓ Ã¹ÆÇÀÏ ¶§¸¸ »õ ·¹ÄÚµå »ý¼º, ÀÌ¹Ì Á¸ÀçÇÏ´Â °æ¿ì curpoint¸¸ ¾÷µ¥ÀÌÆ®µÊ. 
 	public boolean diceBet(String id, int bet); // º£ÆÃ ¹öÆ° ´©¸£¸é (2) update. curpoint¿¡¼­ betpoint Â÷°¨ + bet Ç×¸ñ ¾÷µ¥ÀÌÆ®
	
	public boolean diceAf(String id, int win, int lose, int earned); // roll ¹öÆ° ´©¸£¸é update. È¸Â÷ Á¾·á ÈÄ °á°ú  ¾÷µ¥ÀÌÆ®¿ë
	
	public DiceDto reDice(String id); // °ÔÀÓ ºä »õ·Î°íÄ§ or reset ¹öÆ° Å¬¸¯½Ã ÇöÀç °¡¿ë Æ÷ÀÎÆ® °»½Å¿ë.
>>>>>>> refs/remotes/origin/hs2
}
