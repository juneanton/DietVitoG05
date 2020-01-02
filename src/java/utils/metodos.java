/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Date;

/**
 *
 * @author June
 */
public class metodos {
    public static Date convertir(String fecha) {
        //fecha = dia-mes-año 02/01/2020
        //String yyyy = fecha.substring(6);
        //String mm = fecha.substring(3, 5);
        //String dd = fecha.substring(0, 2);
        
        String yyyy = fecha.substring(6, 9);
        String mm = fecha.substring(3, 5);
        String dd = fecha.substring(0, 2);
        
        fecha = yyyy + "-" + mm + "-" + dd;

        Date date = Date.valueOf(fecha);
        return date;
    }
}
