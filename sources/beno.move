module beno::BENNO {
    use sui::coin;
    use sui::url;

    public struct BENNO has drop {}

    fun init(witness: BENNO, ctx: &mut TxContext) {
        let image_url = url::new_unsafe_from_bytes(b"https://media.themoviedb.org/t/p/w300_and_h450_bestv2/nnCsJc9x3ZiG3AFyiyc3FPehppy.jpg");
        let (mut treasury, metadata) = coin::create_currency(witness, 4, b"BENN", b"Benoire", b"A Test Token", option::some(image_url), ctx);
        transfer::public_freeze_object(metadata);
        coin::mint_and_transfer(&mut treasury, 13370000, tx_context::sender(ctx),ctx);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

}