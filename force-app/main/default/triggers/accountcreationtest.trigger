trigger accountcreationtest on Account (after insert) {
    accountcreationhandler.creation(trigger.new);
}