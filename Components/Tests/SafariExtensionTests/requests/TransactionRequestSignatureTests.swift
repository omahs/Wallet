import Foundation
import XCTest
@testable import SafariExtension
import Commons
import Session
import Domain
import Keychain

class TransactionRequestSignatureTests: XCTestCase {

    func test_safari_request_uniswap_transaction_signature() throws {
        let signature = TransactionRequestSignature(storage: SecureStorageMock())
        let parameters = [
            "chainId":"0x5",
            "from":"0x14791697260e4c9a71f18484c9f997b308e59325",
            "nonce":"0x26",
            "data":"0x5ae401dc00000000000000000000000000000000000000000000000000000000634e14e800000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000e404e45aaf000000000000000000000000b4fbf271143f4fbf7b91a5ded31805e42b2208d60000000000000000000000001f9840a85d5af5bf1d1762f925bdaddc4201f98400000000000000000000000000000000000000000000000000000000000001f400000000000000000000000014791697260e4c9a71f18484c9f997b308e59325000000000000000000000000000000000000000000000000002386f26fc100000000000000000000000000000000000000000000000000000030cbc199a4eaf1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
            "value":"0x2386f26fc10000",
            "gasPrice":"0x44615b8",
            "gas":"0x2a94c",
            "to":"0x68b3465833fb72a70ecdf485e0e4c7bd8665fc45"
        ]
        let ps = PostTransactionSafariRequest(parameters: parameters,
                                              getWallet: GetWalletMock(),
                                              signature: signature)
        XCTAssertEqual(ps.response, "0xf902112684044615b88302a94c9468b3465833fb72a70ecdf485e0e4c7bd8665fc45872386f26fc10000b901a45ae401dc00000000000000000000000000000000000000000000000000000000634e14e800000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000e404e45aaf000000000000000000000000b4fbf271143f4fbf7b91a5ded31805e42b2208d60000000000000000000000001f9840a85d5af5bf1d1762f925bdaddc4201f98400000000000000000000000000000000000000000000000000000000000001f400000000000000000000000014791697260e4c9a71f18484c9f997b308e59325000000000000000000000000000000000000000000000000002386f26fc100000000000000000000000000000000000000000000000000000030cbc199a4eaf10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002ea01f019271f7a2b1f493573687cb1c0c42537a230cf9c56be33ee8cc64a24c33c1a04dcc8aa0e7bcb8bc46bbe12be2589524b6a65ba0b42ea1b694d73816dfab861b")
    }
}
