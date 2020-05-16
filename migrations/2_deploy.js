const iNETsToken = artifacts.require('iNETsToken');
const iNETsRecipient = artifacts.require('iNETsRecipient');
const Flashloan = artifacts.require('Flashloan');

require('@openzeppelin/test-helpers/configure')({ provider: web3.currentProvider, environment: 'truffle' });

// const { singletons } = require('@openzeppelin/test-helpers');

module.exports = async function (deployer, network, accounts) {
    // try {

    //     let lendingPoolAddressesProviderAddress;

    //     switch(network) {
    //     case 'mainnet':
    //     case 'mainnet-fork':
    //     case 'development': // For Ganache mainnet forks
    //         // In a test environment an ERC777 token requires deploying an ERC1820 registry
    //         await singletons.ERC1820Registry(accounts[0]);
    //         lendingPoolAddressesProviderAddress = '0x24a42fD28C976A61Df5D00D0599C34c4f90748c8'; break;
    //     case 'ropsten':
    //     case 'ropsten-fork':
    //         lendingPoolAddressesProviderAddress = '0x1c8756FD2B28e9426CDBDcC7E3c4d64fa9A54728'; break;
    //     case 'kovan':
    //     case 'kovan-fork':
    //         lendingPoolAddressesProviderAddress = '0x506B0B2CF20FAA8f38a4E2B524EE43e1f4458Cc5'; break;
    //     default:
    //         throw Error(`Are you deploying to the correct network? (network selected: ${network})`)
    //     }

    // await deployer.deploy(Flashloan, lendingPoolAddressesProviderAddress)
    await deployer.deploy(iNETsToken);
    const token = await iNETsToken.deployed();

    // await deployer.deploy(Flashloan);
    
    await deployer.deploy(iNETsRecipient, token.address);

    // } catch (e) {
    //     console.log(`Error in migration: ${e.message}`)
    // }
};
