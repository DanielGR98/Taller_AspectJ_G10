public aspect Log {

    pointcut exito() : call(* create*(..) );
    after() : exito() {
    //Aspecto ejemplo: solo muestra este mensaje despu�s de haber creado un usuario 
    	System.out.println("**** User created ****");
    }
    
}