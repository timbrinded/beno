#[test_only]
module beno::beno_tests {
    use beno::BENNO;

    const ENotImplemented: u64 = 0;

    #[test]
    fun test_beno() {
        // pass
    }

    #[test, expected_failure(abort_code = beno::beno_tests::ENotImplemented)]
    fun test_beno_fail() {
        abort ENotImplemented
    }
}

