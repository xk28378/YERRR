import unittest

from project_cryptography import rsa_broadcast_attack

class TestRsaBroadcastAttack(unittest.TestCase):

    def test_1(self):
        N_1 = 132638238735404319963958498179031671725663891103839859388297821642453105805772137269753061490688330712109225542097247081983315550733024559074860752586311462055325539776779125887013263325188986718093615644432743049412042510675448605563902748912409801956518996866375182331309726014115832516424161232086705621439
        c_1 = 107140771448431079231463485400167965261941675472566559900329396729565074105044260089603024510367119099714975529285922436835676437687663741043171982432325707445109797217907340197001482874146751543861524519441087608816190402666051943441885529196192254928041919362323824684735180860926514135540564293874722119685
        N_2 = 149994978060311818442730412009438523596224514260954594146224214719236665924164014664550842298403284158988170438601499549997098035412455004727769351176857657542654870699851428220903060697446164551268378999644878928300504552115804672745926896473393198389532138159887431530265690210787440190193411501397195190523
        c_2 = 31177418864483401780209519502412792553777278019174685865850422697556612270530038592070915294968571642007635394165283997287616108224035002432167542138888427860548306579996152681257555815710155773783352392996556312474198871890230539458609057915235758295406431530103806123354960995808981701830071769245222068548
        N_3 = 143375727848444426609281375341238438380652010802561803468367954485797968159826004344011449845518800942880983034901393965694358900167759771276250867202719355612188773043344046115283464946747834462217987441260157993096982235461947312543455621589706654291736439683545466115228471357347759790338041710784321394441
        c_3 = 2535543940111549676180632391800956427237083147628049140855776427383479238946187069806085935954219987879514496943315214164602272698067222590746285684168985735173798360326011444534867278676425685122169963851073431100531540692062554916249111598569967863097043042616488571324369057183958959233652644519964440285
        m_expected = 14960722152988603333982077186804393262381456198236939574002741841586434916553384438611454644896173598818633043812753335765922751135317419474683616847150

        m = rsa_broadcast_attack(N_1, c_1, N_2, c_2, N_3, c_3)
        self.assertEqual(m, m_expected)

if __name__ == '__main__':
    unittest.main()