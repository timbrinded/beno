module beno::simple {
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::url;

    public struct SIMPLE has drop {}

    fun init(witness: SIMPLE, ctx: &mut TxContext) {
        let image_url = url::new_unsafe_from_bytes(b"https://media.themoviedb.org/t/p/w300_and_h450_bestv2/nnCsJc9x3ZiG3AFyiyc3FPehppy.jpg");
        let (mut treasury, metadata) = coin::create_currency(witness, 4, b"BENN", b"Benoire", b"A Test Token", option::some(image_url), ctx);
        transfer::public_freeze_object(metadata);
        coin::mint_and_transfer(&mut treasury, 13370000, tx_context::sender(ctx),ctx);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    // add mint


    // add burn

    // add deny list

    // remove deny list

    // list deny list

// Update Icon

    public fun mint(
        treasury_cap: &mut TreasuryCap<SIMPLE>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    /// Manager can burn coins
    public fun burn(treasury_cap: &mut TreasuryCap<SIMPLE>, coin: Coin<SIMPLE>) {
        coin::burn(treasury_cap, coin);
    }



    #[test_only]
    /// Wrapper of module initializer for testing
    public fun test_init(ctx: &mut TxContext) {
        init(SIMPLE {}, ctx)
    }
// get_decimals

//get_symbol

// get_description

// supply

}