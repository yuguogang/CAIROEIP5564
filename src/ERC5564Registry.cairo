use starknet::ContractAddress;
use array::SpanTrait;

#[starknet::contract]
mod ERC5564Registry {
    use integer::BoundedInt;
    use starknet::ContractAddress;
    use starknet::get_caller_address;
    use zeroable::Zeroable;
    use starknet::contract_address::ContractAddressZeroable;
    use starknet::contract_address_const;
    use traits::TryInto;
    use traits::Into;
    use option::OptionTrait;

const SECP256K1_GX: u256 = 0x79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798;
const SECP256K1_GY: u256=0x483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8;
const SECP256K1_A: u256 = 0;
const SECP256K1_B: u256 = 7;
const SECP256K1_PP: u256 = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFC2F;


    #[storage]
    struct Storage {
        _name: felt252,
        _symbol: felt252,
        _total_supply: u256,
        _balances: LegacyMap::<ContractAddress, u256>,
        _allowances: LegacyMap::<(ContractAddress, ContractAddress), u256>,
    }

}