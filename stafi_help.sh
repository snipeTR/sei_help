echo -e '\e[0m\e[31m=============== \e[0m\e[32mCommands that will make your job easier. Please note..\e[0m\e[31m===================\e[0m'
echo -e '\e[0m\e[36mcheck LOGS:\t\t\t\t \e[0m\e[32mjournalctl -ujournalctl -u stafihubd -f -o cat\e[0m'
echo -e '\e[0m\e[36msend stafi token to other address:\t \e[0m\e[32mstafihubd tx bank send \033[33;4m<WalletName> <ToAddress> <amount>\e[0m\e[32m000000ufis -y\e[0m'
echo -e '\e[0m\e[36mCheck BALANCE:\t\t\t\t \e[0m\e[32mstafihubd query bank balances \033[33;4m<Address>\e[0m\e[32m -o│json | jq -r .balances[0].amount\e[0m'
echo -e '\e[0m\e[36mLearn MONIKER NAME:\t\t\t \e[0m\e[32mstafihubd status 2>&1 | jq -r .NodeInfo.moniker\e[0m'
echo -e '\e[0m\e[36msync info command:\t\t\t \e[0m\e[32mstafihubd status 2>&1 | jq .SyncInfo\e[0m'
echo -e '\e[0m\e[36mwallet list:\t\t\t\t \e[0m\e[32mstafihubd keys list\e[0m'
echo -e '\e[0m\e[36mvalidator info command:\t\t\t \e[0m\e[32mstafihubd status 2>&1 | jq .ValidatorInfo\e[0m'
echo -e '\e[0m\e[36mNode info command:\t\t\t \e[0m\e[32mstafihubd status 2>&1 | jq .NodeInfo\e[0m'
echo -e '\e[0m\e[36mShow node id:\t\t\t\t \e[0m\e[32mstafihubd tendermint show-node-id\e[0m'
echo -e '\e[0m\e[36mWallet import/recover from mnemonic:\t \e[0m\e[32mstafihubd keys add \033[33;4m<wallet name>\e[0m\e[32m --recover\e[0m'
echo -e '\e[0m\e[36mstafihubd binary path:\t\t\t \e[0m\e[32mtype stafihubd\e[0m'
echo -e '\e[0m\e[36mWallet name info:\t\t\t \e[0m\e[32mstafihubd keys list --output json | jq .[0].name\e[0m'
echo -e '\e[0m\e[36mstafi testnet address info:\t\t \e[0m\e[32mstafihubd keys list --output json | jq .[0].address\e[0m'
echo -e '\e[0m\e[36mstafi testnet pubkey info:\t\t \e[0m\e[32mstafihubd keys list --output json | jq .[0].pubkey\e[0m'
echo -e '\e[0m\e[36mstaking delegate:\t\t\t \e[0m\e[32mstafihubd tx staking delegate \033[33;4m<valoper address>\e[0m\e[32m \033[33;4m<amount>\e[0m\e[32m000000ufis --from=\033[33;4m<wallet_name>\e[0m\e[32m --chain-id=\033[33;4m<chain_id>\e[0m\e[32m --gas=auto\e[0m'
echo -e '\e[0m\e[36mstaking redelegate:\t\t\t \e[0m\e[32mstafihubd tx staking redelegate \033[33;4m<srcValidatorAddress> <destValidatorAddress>\e[0m\e[32m \033[33;4m<amount>\e[0m\e[32m000000ufis --from=\033[33;4m<wallet_name>\e[0m\e[32m --chain-id=\033[33;4m<chain_id>\e[0m\e[32m --gas=auto\e[0m'
echo -e '\e[0m\e[36mwithdraw all rewards:\t\t\t \e[0m\e[32mstafihubd tx distribution withdraw-all-rewards --from=\033[33;4m<wallet_name>\e[0m\e[32m --chain-id=\033[33;4m<chain_id>\e[0m\e[32m --gas=auto\e[0m'
echo -e '\e[0m\e[36mWithdraw rewards with commision:\t \e[0m\e[32mstafihubd tx distribution withdraw-rewards \033[33;4m<ValidatorAddress>\e[0m\e[32m --from=\033[33;4m<wallet_name>\e[0m\e[32m --commission --chain-id=\033[33;4m<chain_id>\e[0m'
echo -e '\e[0m\e[36mEdit validator:\t\t\t\t \e[0m\e[32mstafihubd tx staking edit-validator --moniker=\033[33;4m<moniker_name>\e[0m\e[32m --website=\033[33;4m<your_website>\e[0m\e[32m --details=\033[33;4m<your_validator_description>\e[0m\e[32m --chain-id=\033[33;4m<chain_id>\e[0m\e[32m --from=\033[33;4m<wallet_name>\e[0m'
echo -e '\e[0m\e[36mUnjail validator:\t\t\t \e[0m\e[32mstafihubd tx slashing unjail --broadcast-mode=block --from=\033[33;4m<wallet_name>\e[0m\e[32m --chain-id=\033[33;4m<chain_id>\e[0m\e[32m --gas=auto\e[0m'
echo -e '\e[0m\e[36mVote proposals:\t\t\t\t \e[0m\e[32mstafihubd tx gov vote \033[33;4mX\e[0m\e[32m yes --from=\033[33;4m<wallet_name>\e[0m\e[32m --chain-id=\033[33;4m<chain_id>\n\t\t\t\t\t\t\t  ┕━\033[33;4mX\e[0m\e[32m proposal id, check here \033[33;4mhttps://testnet-explorer.stafihub.io/stafi-hub-testnet/gov\e[0m'



