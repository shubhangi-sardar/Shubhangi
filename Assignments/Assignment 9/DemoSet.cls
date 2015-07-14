public class DemoSet {
    public DemoSet(){
        Set <Lead> leadRecords = new Set <Lead>([Select Id, Name From Lead]);
        //leadRecords = [Select Id, Name From Lead];
        for(Lead i : leadRecords){
            System.debug('Lead Record '+ i);
        }
    }
}