public class apexcal {
    integer varsum;
    integer varmulti;
    public integer makeadditation(integer varnum1, integer varnum2)
    {
        varsum = varnum1 + varnum2;
        return varsum;
    }
    public void makemulti(integer varnum3, integer varnum4)
    {
       varmulti = varnum3 +varnum4;
        system.debug('The answer ='+ varmulti);
    }   
}