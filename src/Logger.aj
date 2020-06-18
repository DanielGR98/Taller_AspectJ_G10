import java.io.File;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.util.Calendar;
public aspect Logger {	
	File file = new File("log.txt");
	Calendar cal= Calendar.getInstance();
	pointcut success(): call(* *.moneyWithdrawal()); 
    after() : success() {
    	try {
    	if (!file.exists()) {
            file.createNewFile();
        }
        FileWriter fw = new FileWriter(file,true);
        BufferedWriter bw = new BufferedWriter(fw);
        bw.write("Dinero Retirado"+ cal.getTime()+"\n");
        bw.close();
        }
    	catch(Exception e) {}
    	System.out.println("Dinero Retirado"+ cal.getTime());
    } 
    pointcut successTransaction(): call(* *.moneyMakeTransaction()); 
    after() : successTransaction() {
    	try {
    	if (!file.exists()) {
            file.createNewFile();
        }
        FileWriter fw = new FileWriter(file,true);
        BufferedWriter bw = new BufferedWriter(fw);
        bw.write("Transaccion exitosa"+ cal.getTime()+"\n");
        bw.close();}
    	catch(Exception e) {}
    	System.out.println("Transaccion exitosa"+ cal.getTime());
    } 
}  
