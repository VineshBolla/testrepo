trigger contactoppcreationtrigger on Contact (after insert) {
    contactopporturnityhandler.oppcreation(trigger.New);
}