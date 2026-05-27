# coding: Cp866 -> koi-8r -> Cp1251
/*  *****************************************************
    *        ╧ЁюуЁрььр ЁрёёўхЄр ъЁштющ Ёрчуюэр         *
    *---------------------------------------------------*
    *          ╨рчЁрсюЄры ╥рЁрёют ╤хЁухщ                *
    *****************************************************/

#include <stdio.h>
#include <math.h>
#include <conio.h>

// todo ╤фхырЄ№ сюы№°х ъюььхэЄрЁшхт

// ╩ырёё юс·хъЄр ЁхуєышЁютрэш  ш хую ЇєэъЎшш
class aa{
    // ─рээ√х яю юс·хъЄє ЁхуєышЁютрэш  т тшфх ёЄЁєъЄєЁ√
    struct Sys{
		long double   // ╬с·хъЄВ
			b = 1.,     // яхЁхфрЄюўэ√щ ъю¤ЇЇшЎшхэЄВ
			T[3],     // яюёЄю ээ√х тЁхьхэш T0...T2, ёхъ.
			tau = 60.,  // тЁхь  чрярчф√трэш , ёхъ.
			x_min = 0., // юуЁрэшўхэш , уЁрф.
			x_max = 99.;// ----||------, уЁрф.
    } *psys;

    unsigned int i,   // эюьхЁ Єюўъш эр уЁрЇшъх
         mi,  // ёў╕Єўшъ
         nt,  // ўшёыю т√тюфшь√ї Єюўхъ уЁрЇшър
         is;  // ўшёыю Єюўхъ фы  Ёрёў╕Єр юЄ эєы 

    long double k[5],         // ъю¤ЇЇшЎшхэЄ√ ъюэхўэю-ЁрчэюёЄэюую єЁртэхэш 
                a[5],         // ъю¤ЇЇшЎшхэЄ√ фшЇЇхЁхэЎшры№эюую єЁртэхэш 
                r,            // єяЁрты ■∙хх тючфхщёЄтшх
                tp,           // тЁхь  яЁюЎхёёр
                dt;           // ътрэЄ яю тЁхьхэш
		
    // ╩юэёЄЁєъЄюЁ ъырёёр
    aa::aa(void){
        // ╫шёыю яЁхф√фє∙шї Єюўхъ т ъюэхўэю-ЁрчэюёЄэюь єЁртэхэшш
        is = 3;
        // ╬ёЄры№э√ї Єюўхъ схч эєы  эр уЁрЇшъх
        nt = 579;
        r = 0.;
    }

    // ╩ю¤ЇЇшЎшхэЄ√ фшЇЇхЁхэЎшры№эюую єЁртэхэш 
    public: 
    void coeff_a(void){
        a[4] = psys->T[0] * psys->T[1] * psys->T[2];
        a[3] = psys->T[0] * psys->T[1] + psys->T[0] * psys->T[2] + psys->T[1] * psys->T[2];
        a[2] = psys->T[0] + psys->T[1] + psys->T[2];
        a[1] = 1.;
        a[0] = 0.;
        return;
    }

    // ╩ю¤ЇЇшЎшхэЄ√ ъюэхўэю-ЁрчэюёЄэюую єЁртэхэш 
    private:
    void coeff_k(void){
        long double c = a[1] + a[2] / dt + a[3] / dt / dt + a[4] / dt / dt / dt;
        k[0] = -a[0] / c;
        k[1] = b / c;
        k[2] = a[2] / dt;
        k[2] += 2. * a[3] / dt / dt;
        k[2] += 3. * a[4] / dt / dt / dt;
        k[2] /= c;
        k[3] = -a[3] / dt / dt;
        k[3] -= 3. * a[4] / dt / dt / dt;
        k[3] /= c;
        k[4] = a[4] / dt / dt / dt / c;
        return;
    }

    // ╥хъє∙р  Єюўър
    public:
    long double cicle(void){
        long double S_graph = 0., // ╧ыю∙рф№ яюф ъЁштющ
                    t_r = 0.;     // ┬Ёхь 
        // ╪ру яю тЁхьхэш
        dt = tp / (long double)(nt * is);

        // ╫шёыю ЄръЄют чрярчф√трэш 
        unsigned int d = (unsigned int) ceil(psys->tau / dt);
        
        // ┬√фхы хь т юяхЁрЄштъх ьрёёшт ш юсэєы хь хую
        long double* x = new long double[d+4];
        for(mi = 0; mi <= d + 3; mi++)
            x[mi] = 0.;

        coeff_k();
        do{
            x[d+3] = k[1] * r;
            x[d+3] += k[2] * x[d+2];
            x[d+3] += k[3] * x[d+1];
            x[d+3] += k[4] * x[d];
            // ╤ўшЄрхь яыю∙рф№ яюф ъЁштющ
            for(mi = 1; mi <= d + 3; mi++)
                x[mi-1] = x[mi];
            S_graph += fabs(dt * (x[0] + x[1]) / 2.);
            t_r += dt;
        }while(t_r <= tp);
        delete [] x;
        return S_graph;
    }

    // ╩Ёштр  Ёрчуюэр
    public:
    void rasgon(void){
        long double S_graph_0, // ╧ыю∙рф№ яюф 1-ющ ъЁштющ
                    S_graph_1, // ╧ыю∙рф№ яюф 2-ющ ъЁштющ
                    ras;       // ╨рчэюёЄ№ т Ёрёў╕Єрї
        
        // ═рўшэрхь ёэютр ё 3-ї
        is = 3;
        
        // ─р╕ь ёЄєяхэ№ъє эр тїюфх юс·хъЄр
        r = 1. / b;
        
        // ╨шёєхь яхЁтє■ ышэш■
        S_graph_0 = cicle();
        do{
            // ╙фтрштрхь ўшёыю Єюўхъ Ёрёў╕Єр
            is *= 2;
            // ╨шёєхь тЄюЁє■ ышэш■
            S_graph_1 = cicle();
            // ╤ўшЄрхь шэЄхуЁры№эє■ ЁрчэшЎє
            ras = S_graph_1 - S_graph_0;
            // ╤фтшурхь эют√щ уЁрЇшъ т ёЄрЁ√щ
            S_graph_0 = S_graph_1;
            // ┴шсшърхь
            sound(2000);
            delay(200);
            sound(3000);
            delay(500);
            nosound();
        }while(1);
        return;
    }

    // ╫Єхэшх фрээ√ї шч Їрщыр
    public:
    void read_dat(void){
        // ─рээ√х т Їрщых "zsr_asu.dat"
        FILE* io = fopen(file_name, "rb");
        if(io == NULL)
            opros();
        io = fopen(file_name, "wb");
            fwrite(psys, sizeof(Sys), 1, io);
        else{
            fread(psys, sizeof(Sys), 1, io);
        }
        fclose(io);
        return;
    }

    // ╤юїЁрэхэшх фрээ√ї т Їрщы
    public:
    void record_dat(void){
        FILE* io = fopen(file_name, "wb");
        fwrite(psys, sizeof(Sys), 1, io);
        fclose(io);
    }

    // ┬тюф шёїюфэ√ї фрээ√ї
    public:
    void opros(void){
// todo тёЄртшЄ№ ё■фр ттюф шёїюфэ√ї фрээ√ї ш эрўры№эюую яЁшсышцхэш 
    }
} *paa;  // єърчрЄхы№ эр ъырёё юс·хъЄр

void  main(void){
    char pp = 'b';
    char* file_name = "zsr_asu.dat";
    paa->read_dat();
    do{
    	paa->coeff_a();
    	switch(pp){
    		case 'a':
    			paa->opros();
    			break;
    	    case 'c':
    	    	paa->rasgon();
    	}
    }while(pp != 'x');
    paa->record_dat();
}
