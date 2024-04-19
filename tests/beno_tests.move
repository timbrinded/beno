#[test_only]
module beno::beno_tests {
    use beno::simple::{Self, SIMPLE};
    use sui::coin::{Coin, TreasuryCap};
    use sui::test_scenario::{Self, next_tx, ctx};


#[test]
    fun mint_burn() {
        // Initialize a mock sender address
        let addr1 = @0xA;

        // Begins a multi transaction scenario with addr1 as the sender
        let mut scenario = test_scenario::begin(addr1);
        
        // Run the managed coin module init function
        {
            simple::test_init(ctx(&mut scenario))
        };

        // Mint a `Coin<MANAGED>` object
        next_tx(&mut scenario, addr1);
        {
            let mut treasurycap = test_scenario::take_from_sender<TreasuryCap<SIMPLE>>(&scenario);
            simple::mint(&mut treasurycap, 100, addr1, test_scenario::ctx(&mut scenario));
            test_scenario::return_to_address<TreasuryCap<SIMPLE>>(addr1, treasurycap);
        };

        // Burn a `Coin<MANAGED>` object
        next_tx(&mut scenario, addr1);
        {
            let coin = test_scenario::take_from_sender<Coin<SIMPLE>>(&scenario);
            let mut treasurycap = test_scenario::take_from_sender<TreasuryCap<SIMPLE>>(&scenario);
            simple::burn(&mut treasurycap, coin);
            test_scenario::return_to_address<TreasuryCap<SIMPLE>>(addr1, treasurycap);
        };

        // Cleans up the scenario object
        test_scenario::end(scenario);
    }

}

