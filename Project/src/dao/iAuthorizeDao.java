package dao;

import java.util.List;

import dto.AuthorizeDto;

public interface iAuthorizeDao {
	
	public boolean addRow(String id);
	
<<<<<<< HEAD
	public boolean fillMoney(String id, int fill_money); // ì¶©ì „ ê¸ˆì•¡ ì…ë ¥ í›„ ì¶©ì „ ë²„íŠ¼ ëˆ„ë¥´ë©´ í–‰ ì¶”ê°€ + status 0(ìŠ¹ì¸ëŒ€ê¸°ì¤‘)ìœ¼ë¡œ ì…‹íŒ…. 

	public boolean toMoney(String id, int to_money); // ì¶©ì „ ê¸ˆì•¡ ì…ë ¥ í›„ ì¶©ì „ ë²„íŠ¼ ëˆ„ë¥´ë©´ í–‰ ì¶”ê°€ + status 0(ìŠ¹ì¸ëŒ€ê¸°ì¤‘)ìœ¼ë¡œ ì…‹íŒ…. 

	
	public List<AuthorizeDto> getBbsList(); // ê´€ë¦¬ìëª¨ë“œ ì¶©ì „/í™˜ì „ ë·°ì— ë¦¬ìŠ¤íŠ¸ ë¿Œë¦¬ê¸°
	
	public boolean authNo(String id); 
	
	public boolean authOk(String id, int status);
	
	public AuthorizeDto getRow(String id); // ìŠ¹ì¸ìƒíƒœ ì¡°íšŒìš©
	
	
	////////////////
	/// ì²˜ìŒ ë¡œë“œí–ˆì„ë•Œ 9ë¡œ ì…‹íŒ…. ì¶©ì „ , í™˜ì „ ë²„íŠ¼ ëˆ„ë¥´ë©´ FILL_MONEY, TO_MONEYì— ê°’ ë“¤ì–´ê°€ê³ , STATUS 0ìœ¼ë¡œ ë°”ë€œ.
	
	/// ê´€ë¦¬ìê°€ FILL_MONEY ìŠ¹ì¸í•˜ë©´  STATUS 1ë¡œ ë°”ê¾¼ í›„ MEMBERì— ê¸ˆì•¡ ì—…ë°ì´íŠ¸í•˜ê³  FILL_MONEY 0ìœ¼ë¡œ ë¦¬ì…‹, 
	//        TO_MONEY ìŠ¹ì¸í•˜ë©´ STATUS 2ë¡œ ë°”ê¾¼ í›„ ê¸ˆì•¡ ì—…ë°ì´íŠ¸í•˜ê³  TO_MONEY 0ìœ¼ë¡œ ë¦¬ì…‹, 
	//        ê±°ì ˆí•˜ë©´ -1ë¡œ ì…‹íŒ…. 
	
}
=======
	public boolean fillMoney(String id, int fill_money); // ÃæÀü ±İ¾× ÀÔ·Â ÈÄ ÃæÀü ¹öÆ° ´©¸£¸é Çà Ãß°¡ + status 0(½ÂÀÎ´ë±âÁß)À¸·Î ¼ÂÆÃ. 

	public boolean toMoney(String id, int to_money); // ÃæÀü ±İ¾× ÀÔ·Â ÈÄ ÃæÀü ¹öÆ° ´©¸£¸é Çà Ãß°¡ + status 0(½ÂÀÎ´ë±âÁß)À¸·Î ¼ÂÆÃ. 

	
	public List<AuthorizeDto> getBbsList(); // °ü¸®ÀÚ¸ğµå ÃæÀü/È¯Àü ºä¿¡ ¸®½ºÆ® »Ñ¸®±â
	
	public boolean authNo(String id); 
	
	public boolean authOk(String id, int status);
	
	public AuthorizeDto getRow(String id); // ½ÂÀÎ»óÅÂ Á¶È¸¿ë
	
	
	////////////////
	/// Ã³À½ ·ÎµåÇßÀ»¶§ 9·Î ¼ÂÆÃ. ÃæÀü , È¯Àü ¹öÆ° ´©¸£¸é FILL_MONEY, TO_MONEY¿¡ °ª µé¾î°¡°í, STATUS 0À¸·Î ¹Ù²ñ.
	
	/// °ü¸®ÀÚ°¡ FILL_MONEY ½ÂÀÎÇÏ¸é  STATUS 1·Î ¹Ù²Û ÈÄ MEMBER¿¡ ±İ¾× ¾÷µ¥ÀÌÆ®ÇÏ°í FILL_MONEY 0À¸·Î ¸®¼Â, 
	//        TO_MONEY ½ÂÀÎÇÏ¸é STATUS 2·Î ¹Ù²Û ÈÄ ±İ¾× ¾÷µ¥ÀÌÆ®ÇÏ°í TO_MONEY 0À¸·Î ¸®¼Â, 
	//        °ÅÀıÇÏ¸é -1·Î ¼ÂÆÃ. 
	
}
>>>>>>> refs/remotes/origin/hs2
