# coding: Cp866 -> koi-8r -> Cp1251
       /* ╘рщы юс· тыхэш  ъырёёр юс·хъЄр ЁхуєышЁютрэш  ш ьхЄюфют ¤Єюую ъырёёр.
           +----------------------------------+       
           |╨рчЁрсюЄры ёЄєфхэЄ 4-ую ъєЁёр ┬╥╚ |       
           |  ╥рЁрёют ╤хЁухщ, уЁєяяр └-903    |       
           +----------------------------------+       
                  эрўрЄю     * 16-12-1994             
                  яЁюфюыцхэю * 01-08-2002*/
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <conio.h>
#include <dos.h>

// todo ╤фхырЄ№ сюы№°х ъюььхэЄрЁшхт
class aa{
    /******* ─рээ√х яю ёшёЄхьх т тшфх ёЄЁєъЄєЁ√ **********************/
    struct Sys{
        long double // юс·хъЄ (ряхЁшюфшўхёъюх чтхэю 3-ую яюЁ фър ё чрярчф√трэшхь)
            b, // яхЁхфрЄюўэ√щ ъю¤ЇЇшЎшхэЄ
            T[4], // яюёЄю ээ√х тЁхьхэш
            tau, // тЁхь  чрярчф√трэш 
            x_min, // юуЁрэшўхэш 
            x_max, // ----||------
    // фрЄўшъ (ряхЁшюфшўхёъюх чтхэю 1-ую яюЁ фър)
            k_dat,
            T_dat,
            dat_min,
            dat_max,
    // шёяюыэшЄхы№э√щ ьхїрэшчь (шэЄхуЁшЁє■∙хх чтхэю)
            k_im,
            T_im,
            s_min,
            s_max,
    // ЁхуєышЁє■∙шщ юЁурэ (эхышэхщэюх чтхэю)
            k_ro,
    // яЁюь√°ыхэ√щ ╧╚-Ёхуєы ЄюЁ
            k_prop,
            T_iz,
            q_min,
            q_max;
    } *psys;
    UINT i,   // эюьхЁ Єюўъш эр уЁрЇшъх
         j,   // эюьхЁ Єюўъш ьхцфє Єюўърьш уЁрЇшър
         mi,  // ёў╕Єўшъ
         nt,  // ўшёыю Єюўхъ уЁрЇшър
         is;  // ўшёыю Єюўхъ фы  Ёрёёў╕Єр юЄ эєы 
    long double k[5],         // ъю¤ЇЇшЎшхэЄ√ ъюэхўэю-ЁрчэюёЄэюую єЁртэхэш 
                a[5],         // ъю¤ЇЇшЎшхэЄ√ фшЇЇхЁхэЎшры№эюую єЁртэхэш 
                r,            // єяЁрты ■∙хх тючфхщёЄтшх
                z,            // чрфрэшх
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
    /***  ╨рёёўхЄ ъю¤ЇЇшЎшхэЄют фшЇЇхЁхэЎшры№эюую єЁртэхэш  юс·хъЄр ***/
    public: 
    void coeff_a(void){
        a[4] = psys->T[1] * psys->T[2] * psys->T[3];
        a[3] = psys->T[1] * psys->T[2] + psys->T[1] * psys->T[3] + psys->T[2] * psys->T[3];
        a[2] = psys->T[1] + psys->T[2] + psys->T[3];
        a[1] = 1.;
        a[0] = 0.;
        return;
    }
    /********  ╨рёёўхЄ ъюхЇЇшЎшхэЄют ъюэхўэю-ЁрчэюёЄэюую єЁртэхэш  **/
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
    /***************  ╓шъы Ёрчуюэр ***********************************/
    public:
    long double cicle(void){
        long double S_graph = 0., // ╧ыю∙рф№ яюф ъЁштющ
                    t_r = 0.;     // ┬Ёхь 
        // °ру яю тЁхьхэш
        dt = tp / (long double)(nt * is);
        // ўшёыю ЄръЄют чрярчф√трэш 
        UINT d = (UINT) ceil(psys->tau / dt);
        // ┬√фхы хь т юяхЁрЄштъх ьрёёшт ш юсэєы хь хую
        long double* x = new long double[d+4];
        for(mi = 0; mi <= d + 3; mi++)
            x[mi] = 0.;
        coeff_k();
        j = 1;
        i = 0;
        do{
            x[d+3] = k[1] * r;
            x[d+3] += k[2] * x[d+2];
            x[d+3] += k[3] * x[d+1];
            x[d+3] += k[4] * x[d];
            if(j >= is){
                i++;
                j = 1;
                // ╤Єртшь Єюўъє
                // x[0]
            }
            // ╤ўшЄрхь яыю∙рф№ яюф ъЁштющ
            S_graph += fabs(dt * (x[0] + x[1]) / 2.);
            for(mi = 1; mi <= d + 3; mi++)
                x[mi-1] = x[mi];
            j++;
            t_r += dt;
        }while(t_r <= tp);
        delete [] x;
        return S_graph;
    }
    /******* ╩Ёштр  Ёрчуюэр *********************/
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
    /*** ╓шъы яхЁхїюфэюую яЁюЎхёёр ************************/
    private:
    void cicle_u(void){
        long double dat_i,      // ёшуэры ё фрЄўшър
                    dat_i_1 = 0.,
                    eps_i,      // ю°шсър ЁхуєышЁютрэш 
                    q,          // ёшуэры ё Ёхуєы ЄюЁр
                    s_i,        // яюыюцхэшх ЁхуєышЁє■∙хую єЁютэ 
                    s_i_1 = 0.,
                    int_ras = 0.,   // ю°шсър ЁхуєышЁютрэш 
                    pereregul = 0., // яхЁхЁхуєышЁютрэшх
                    t_r = 0.;       // тЁхь  Ёрёёў╕Єэюх
        // ╩трэЄ тЁхьхэш
        dt = tp / (long double) (nt * is);
        // ╫шёыю ЄръЄют чрярчф√трэш 
        UINT d = (UINT) ceil(psys->tau / dt);
        long double* x = new long double [d+4];
        for(mi = 0; mi <= d + 3; mi++)
           x[mi] = 0.;
        coeff_k();
        j = 1;
        i = 0;
        do{
            // ╠хэ хь чрфрэшх
            z = 1.;
            // ╬°шсър ЁхуєышЁютрэш 
            eps_i = z - x[0];
            // ╤шуэры ё фрЄўшър
            dat_i = psys->k_dat * eps_i + dat_i_1 * psys->T_dat / dt;
            dat_i /= 1. + psys->T_dat / dt;
            if(dat_i >= psys->dat_max)
                dat_i = psys->dat_max;
            if(dat_i < psys->dat_min)
                dat_i = psys->dat_min;
            // ╤шуэры юЄ ╧╚-Ёхуєы ЄюЁр
            q = (dat_i + dat_i_1) / 2.;
            q *= dt / psys->T_iz;
            q += eps_i;
            q *= psys->k_prop;
            if(q >= psys->q_max)
                q = psys->q_max;
            if(q < psys->q_min)
                q = psys->q_min;
            // ╧юыюцхэшх ЁхуєышЁє■∙хую юЁурэр
            s_i = dt * psys->k_im * q / psys->T_im + s_i_1;
            if(s_i >= psys->s_max)
                s_i = psys->s_max;
            if(s_i < psys->s_min)
                s_i = psys->s_min;
            // ╙яЁрты ■∙хх тючфхщёЄтшх
            r = psys->k_ro * pow(s_i, 0.25);
            // ╨хръЎш  юс·хъЄр эр ¤Єю
            x[d+3] = k[1] * r;
            x[d+3] += k[2] * x[d+2];
            x[d+3] += k[3] * x[d+1];
            x[d+3] += k[4] * x[d];
            if(j >= is){
               i++;
               j = 1;
               // ╤Єртшь Єюўъє эр уЁрЇшъх
               // x[0]
            }
            j++;
            // ╤ўшЄрхь яхЁхЁхуєышЁютрэшх
            if(x[0] > pereregul)
               pereregul = x[0];
            // ╤ўшЄрхь шэЄхуЁры№эє■ ю°шсъє ЁхуєышЁютрэш 
            int_ras += dt * pow(eps_i, 2.);
            // ─тшцхьё  тю тЁхьхэш
            t_r += dt;
            // ╤фтшурхь тёх Єюўъш эр юфшэ ЄръЄ эрчрф
            for(mi = 1; mi <= d + 3; mi++)
               x[mi-1] = x[mi];
            dat_i_1 = dat_i;
            s_i_1 = s_i;
        }while(t_r <= tp);
        // ╧хЁхЁхуєышЁютрэшх
        pereregul = (long double) ceil(100. * (pereregul - x[0]));
        delete [] x;
        // ╚эЄхуЁры№эр  ю°шсър ЁхуєышЁютрэш 
        // int_ras
        return;
    }
    /************* ╧хЁхїюфэющ яЁюЎхёё **************/
    public:
    void per(void){
        do{
            cicle_u();
            // ┴шсшърхь
            sound(5000);
            delay(200);
            sound(4000);
            delay(500);
            nosound();
        }while('x' != getch());
        return;
    }
    /*********  ╫Єхэшх фрээ√ї шч Їрщыр  ******************/
    public:
    void read_dat(void){
        // ─рээ√х т "zsr_asu.dat" т Єхъє∙хщ яряъх
        FILE* io = fopen(file_name, "rb");
        if(io != NULL)
            fread(psys, sizeof(Sys), 1, io);
        else{
            paa->opros_p();
            io = fopen(file_name, "wb");
            fwrite(psys, sizeof(Sys), 1, io);
        }
        fclose(io);
        return;
    }
    /******** ╤юїЁрэхэшх фрээ√ї т Їрщы ***************************/
    public:
    void record_dat(void){
        FILE* io = fopen(file_name, "wb");
        fwrite(psys, sizeof(Sys), 1, io);
        fclose(io);
    }
} *paa;
