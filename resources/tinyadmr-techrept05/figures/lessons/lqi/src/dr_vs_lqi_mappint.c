//DR = a * LQI + b

if( (LQI >= 50) && (LQI < 62.38) ) {
        return (0.2989*LQI - 14.9454);
} else if( (LQI >= 62.38) && (LQI < 83.6)) {
        return (4.2372*LQI - 260.6115);
} else if( (LQI >= 83.6) && (LQI <=110)) {
        return (0.2644*LQI + 71.4933);
}
