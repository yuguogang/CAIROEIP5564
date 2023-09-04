use starknet::ContractAddress;
use array::SpanTrait;

#[starknet::interface]
trait IERC5564Messager<TContractState> {
    fn anounce(ref self: TContractState, schemeId: u256, stealthAddress: ContractAddress, ephemeralPubKey: felt252,metadata:&[u8]
    );
}
#[starknet::contract]
mod ERC5564Messager {
    use integer::BoundedInt;
    use super::IERC5564Messager;
    use starknet::ContractAddress;
    use starknet::get_caller_address;
    use zeroable::Zeroable;
    use starknet::contract_address::ContractAddressZeroable;
    use starknet::contract_address_const;
    use traits::TryInto;
    use traits::Into;
    use option::OptionTrait;
    use array::{ArrayTrait,SpanTrait};
    use arrayref::{array_ref, array_mut_ref};

const SECP256K1_GX: u256 = 0x79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798;
const SECP256K1_GY: u256 = 0x483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8;
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
/// @dev Emitted when sending something to a stealth address.
/// @dev See the `announce` method for documentation on the parameters.
 #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        Accouncement: Accouncement,
    }

    #[derive(Drop,starknet::Event)]
    struct Accouncement {
     schemeId: u256, 
     stealthAddress: ContractAddress, 
     caller: ContractAddress, 
     ephemeralPubKey: felt252, 
     metadata: &[u8]
    }
    
    fn parse_public_key(ref self: ContractState,public_key: Array<u8>) -> (u256, u256) {
    // 检查公钥的长度是否为 64 字节，否则 panic
    assert(public_key.len()==64, 'Invalid public key length');

    // 使用数组切片来获取公钥的 x 和 y 坐标数据
    let x = array_ref!(public_key, 0, 32);
    let y = array_ref!(public_key, 32, 32);

    // 将数组转换为 u256 类型的值并返回
    let x_value:u256 = x.unbox();
    let y_value:u256 = y.unbox();

    (x_value, y_value)
}

}