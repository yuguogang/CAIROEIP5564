use starknet::ContractAddress;
use array::SpanTrait;

#[starknet::interface]
trait IERC5564Messager<TContractState> {
    fn anounce(ref self: TContractState, schemeId: u256, stealthAddress: ContractAddress, ephemeralPubKey: felt252,metadata:&[u8]
    );
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

 