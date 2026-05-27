# Codepage Cp866 -> koi-8r -> Cp1251
/*  Ввод исходных данных */
// todo Сделать больше комментариев

void vvod(void){
    printf("\n  Введите степень полинома ");
    scanf("%d", &m);
    printf("\n  Введите число экспериментальных точек (не менее %d) ", m+2);
    scanf("%d", &number);
    f1 = number - 1;
    f2 = number - m - 1;
    printf("\n  Введите критическое значение критерия Фишера Fkp.[%d, %d] ", f1, f2);
    scanf("%f", &fk);
    for(i = 1; i <= number; i++){
    	printf("\n   Введите %d-ую точку\n ", i);
    	scanf("%f", &x[i]);
    	scanf("%f", &y[i]);
    }
}

/* Расчет */
void raschet(void){
    // Вычисление массива степеней
    for(i = 1; i <= m * 2; i++){
    	p[i] = 0.;
    }
	for(j = 1; j <= number; j++)
	    p[i] += pow(x[j], i);
    }
    // Вычисление коэффициентов нормальных уравнений
    n = m + 1;
    for(i = 1; i <= number; i++){
    	for(j = 1; j <= n; j++){
    		k = i + j - 2;
    		if(k > 0)
    			a[i][j] = p[k];
    		else
    			a[i][j] = number;
    	}
    }
    // Вычисление свободных членов нормальных уравнений
    for(i = 1; i <= n; i++){
    	b[i] = 0.;
    	for(j = 1; j <= number; j++)
    		b[i] += y[j] * pow(x[j], i - 1);
    }
    // Решение системы уравнений методом Гаусса
    for(k = 1; k <= m; k++){
        kp1 = k + 1;
        l = k;
        for(i = kp1; i <= n; i++)
        	if(fabs(a[i][j] - fabs(a[i][k]) > 0.)
        			l = i;
        	if(l - k <= 0.)
        		goto m2;
        for(j = k; j <= n; j++)
        	//  Установление адекватности
        	sost = 0.;  //  Дисперсия остаточная (мера точности аппроксимации)
        sv = 0.;    //  Дисперсия отклонения относительно среднего, обнуляем
        sr = 0.;
        for(i = 1; i <= number; i++)
        		sr += y[i];
        sr /= number;
        for(i = 1; i <= number; i++){
        	sost += pow(y[i] - yr[i], 2);
        	sv += pow(y[i] - sr, 2);
        }
        sost /= f2;
        sv /= f1;
        f = sv / sost;
        printf("\n  sr=%f", sr);
        printf("\n  Дисперсия остаточная = %f", sqrt(sost));
        printf("\n  Дисперсия отклонения = %f", sqrt(sv));
        printf("\n  Кр. значение критерия Фишера(%d,%d) = %f \n  Критерия Фишера = %e", f1, f2, fk, f);
        if(f => fk)
        	printf("\n  Модель адекватна");
        else
        	printf("\n  Модель неадекватна");
        // Оценка тесноты связи
        teta = sqrt((1. - f2 * sost / f1 / sv);
        // Определение коэффициента парной корреляции
        sxy = 0.;
        sx = 0.;
        sy = 0.;
        sx2 = 0.;
        sy2 = 0.;
        for(i = 1; i <= number; i++){
        	sxy += x[i] * y[i];
        	sx += x[i];
        	sy += y[i];
        	sx2 += pow(x[i], 2);
        	sy2 += pow(y[i], 2);
        }
        r = number * sxy - sx - sy;
        r /= sqrt((number * sx2 - pow(sx, 2)) * (number * sy2 - pow(sy, 2)));
        printf("\n  Коэффициент парной корреляции = %f", r);
        printf("\n  Сила связи = %f", teta);
}
