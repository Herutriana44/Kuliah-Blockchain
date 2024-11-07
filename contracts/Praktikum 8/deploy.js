// imports
const { ethers } = require("hardhat")

// async main
async function main() {
  const SimpleStorageFactory = await ethers.getContractFactory(
    "SimpleStorage"
  )
  console.log("Deploying contract...")
  const simpleStorage = await SimpleStorageFactory.deploy()
  console.log(`Deployed contract to: ${simpleStorage.target}`)

  // const currentValue = await simpleStorage.retrieve()
  // console.log(`Current Value is: ${currentValue}`)

  // const transactionResponse = await simpleStorage.store(7)
  // await transactionResponse.wait(1)
  // const updateValue = await simpleStorage.retrieve()
  // console.log(`Update Value is: ${updateValue}`)
}

// main
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })