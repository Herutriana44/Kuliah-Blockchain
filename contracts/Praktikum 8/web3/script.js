import { ethers } from "https://cdnjs.cloudflare.com/ajax/libs/ethers/6.7.0/ethers.min.js";
import { abi, contractAddress } from "./constant.js"

const connectbutton = document.getElementById("connectMetamask");
const storebutton = document.getElementById("store");
const storeinput = document.getElementById("inputStore");
const retrieveButton = document.getElementById("retrieve");
const outputFavNumber = document.getElementById("fav-num");

const connect = async () => {
    if (typeof window.ethereum !== 'undefined') {
        await window.ethereum.request({ method: "eth_requestAccounts" });
        connectbutton.innerHTML = 'Connected';
        // status = true;
    } else {
        alert("Please Install Metamask");
    }
}

connectbutton.onclick = connect

const retrieve = async () => {
    if (typeof window.ethereum !== 'undefined') {
        const provider = new ethers.BrowserProvider(window.ethereum)
        const signer = await provider.getSigner()
        const contract = new ethers.Contract(contractAddress, abi, signer)
        try {
            const currValue = await contract.retrieve()
            outputFavNumber.innerHTML = currValue.toString()
        } catch (err) {
            console.error(err)
        }
    }
}

retrieveButton.onclick = retrieve;

const store = async () => {
    const ethAmount = storeinput.value;
    if (typeof window.ethereum !== 'undefined') {
        const provider = new ethers.BrowserProvider(window.ethereum)
        const signer = await provider.getSigner()
        const contract = new ethers.Contract(contractAddress, abi, signer)
        try {
            const transactionResponse = await contract.store(ethAmount)
            await transactionResponse.wait(1)
            console.log("Done")
        } catch (err) {
            console.error(err)
        }
    }
}

storebutton.onclick = store;