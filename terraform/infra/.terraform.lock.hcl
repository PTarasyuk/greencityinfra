# This file is maintained automatically by "tofu init".
# Manual edits may be lost in future updates.

provider "registry.opentofu.org/gavinbunney/kubectl" {
  version     = "1.19.0"
  constraints = "~> 1.19.0"
  hashes = [
    "h1:quymfa/OKEfWI5JXFEwGbUY2aAy0vet3rA9JWJam+3k=",
    "zh:1dec8766336ac5b00b3d8f62e3fff6390f5f60699c9299920fc9861a76f00c71",
    "zh:43f101b56b58d7fead6a511728b4e09f7c41dc2e3963f59cf1c146c4767c6cb7",
    "zh:4c4fbaa44f60e722f25cc05ee11dfaec282893c5c0ffa27bc88c382dbfbaa35c",
    "zh:51dd23238b7b677b8a1abbfcc7deec53ffa5ec79e58e3b54d6be334d3d01bc0e",
    "zh:5afc2ebc75b9d708730dbabdc8f94dd559d7f2fc5a31c5101358bd8d016916ba",
    "zh:6be6e72d4663776390a82a37e34f7359f726d0120df622f4a2b46619338a168e",
    "zh:72642d5fcf1e3febb6e5d4ae7b592bb9ff3cb220af041dbda893588e4bf30c0c",
    "zh:9b12af85486a96aedd8d7984b0ff811a4b42e3d88dad1a3fb4c0b580d04fa425",
    "zh:a1da03e3239867b35812ee031a1060fed6e8d8e458e2eaca48b5dd51b35f56f7",
    "zh:b98b6a6728fe277fcd133bdfa7237bd733eae233f09653523f14460f608f8ba2",
    "zh:bb8b071d0437f4767695c6158a3cb70df9f52e377c67019971d888b99147511f",
    "zh:dc89ce4b63bfef708ec29c17e85ad0232a1794336dc54dd88c3ba0b77e764f71",
    "zh:dd7dd18f1f8218c6cd19592288fde32dccc743cde05b9feeb2883f37c2ff4b4e",
    "zh:ec4bd5ab3872dedb39fe528319b4bba609306e12ee90971495f109e142d66310",
    "zh:f610ead42f724c82f5463e0e71fa735a11ffb6101880665d93f48b4a67b9ad82",
  ]
}

provider "registry.opentofu.org/hashicorp/aws" {
  version     = "5.90.1"
  constraints = ">= 3.29.0, >= 4.33.0, >= 4.36.0, >= 4.47.0, >= 5.0.0, >= 5.59.0, >= 5.62.0, >= 5.79.0, >= 5.83.0, ~> 5.90.1"
  hashes = [
    "h1:KqUBJkq+mM8+rfeAbvWlOxbPavEplbj5sTsWQehsfM4=",
    "zh:090d7544b88d928049094f24d390d3432edc0ad191a096e68dd775500fe0ca1b",
    "zh:0ce79633dd94ddb6d9789c540140c2afd67f45147367dbe56e01919fad2d1291",
    "zh:12218248e4efbfa9ad0541acbb27e679e7d90e69c2d84bc8d731706ac6d75abf",
    "zh:3ffd37af717ae1494c240a51519e3408c755feeb7865220101081f1116140fa9",
    "zh:41c88889e7075a21e196255056e5d6899fa2ac4b59b1f2e267e5f838945f15f0",
    "zh:8b4874a7c1d27788c15e83e303097a3235a9b2adc5fa6998bb1bd4770381e0a2",
    "zh:a3677cee57d18a8ac70361f254366fd5af99d5e25930a14816fa4ab0c2b911db",
    "zh:b22a4aae3e1b47c3d84cb070036375cd11888c1e678a4dbe263b5458f1d0870d",
    "zh:c0c7490b6e2d4fe34a1a5e16a72e06e109ae2c75356ca2b559550f6f5b48324e",
    "zh:edfc1927e0ace6b2520f11cb45672181c63a58218bf7f6a93daf37e0301919b7",
  ]
}

provider "registry.opentofu.org/hashicorp/cloudinit" {
  version     = "2.3.6"
  constraints = ">= 2.0.0"
  hashes = [
    "h1:QOs7/ygYQFnXvh4vVux/WBmHXYXOwzBQgVNOUr+EfgE=",
    "zh:0ad497b645e83bc82fac2fc6dbf63ff4b465dd18e9b0265b1852462e12a8cd4c",
    "zh:10666a26ba19fdccdaf011f6b0c10ad9b80182afd1444ab28f669739a06d19a0",
    "zh:57de6a85287c081647fdc57096c164b0f84ca36327aabaee66c425547117ac13",
    "zh:57f7dc71c6fb22ad6b42fdcfdf8e1fa14ddb5cf0185dfd292ce73e02f050480d",
    "zh:631ee274a22afcaa46b792f0cac56e8ea8894cbeb60f1119ae421b9c263f7b32",
    "zh:6fd78c16cca8ec454a7c9a1b76d08617d17af5dd2bfb546e30da8940539d3aa7",
    "zh:843f882ed06b9cb77fef3bd178b493117d7121d99c8eb36bc81e5e11b6979606",
    "zh:a18e078db3c49264a45dfedbe99e8b3cb170fa7b8a9b253a176e9e96f1da8f9f",
    "zh:a9aa2a5a3300254b27385c265201aece8bf1406d7229da4b4225263070a3c809",
    "zh:b6225ae80101db018d4b372c6dc776412c45607ed859eb9bcd7e8589cc2b9393",
  ]
}

provider "registry.opentofu.org/hashicorp/helm" {
  version     = "2.17.0"
  constraints = ">= 2.9.0, ~> 2.17.0"
  hashes = [
    "h1:ShIag7wqd5Rs+zYpVMpjAh+T0ozr4XGYfSTKWqceQBY=",
    "zh:02690815e35131a42cb9851f63a3369c216af30ad093d05b39001d43da04b56b",
    "zh:27a62f12b29926387f4d71aeeee9f7ffa0ccb81a1b6066ee895716ad050d1b7a",
    "zh:2d0a5babfa73604b3fefc9dab9c87f91c77fce756c2e32b294e9f1290aed26c0",
    "zh:3976400ceba6dda4636e1d297e3097e1831de5628afa534a166de98a70d1dcbe",
    "zh:54440ef14f342b41d75c1aded7487bfcc3f76322b75894235b47b7e89ac4bfa4",
    "zh:6512e2ab9f2fa31cbb90d9249647b5c5798f62eb1215ec44da2cdaa24e38ad25",
    "zh:795f327ca0b8c5368af0ed03d5d4f6da7260692b4b3ca0bd004ed542e683464d",
    "zh:ba659e1d94f224bc3f1fd34cbb9d2663e3a8e734108e5a58eb49eda84b140978",
    "zh:c5c8575c4458835c2acbc3d1ed5570589b14baa2525d8fbd04295c097caf41eb",
    "zh:e0877a5dac3de138e61eefa26b2f5a13305a17259779465899880f70e11314e0",
  ]
}

provider "registry.opentofu.org/hashicorp/kubernetes" {
  version     = "2.36.0"
  constraints = ">= 2.20.0, ~> 2.36.0"
  hashes = [
    "h1:O/JNwmUFXK8wQ6OEL5lH7akEYt0K5B1ClLpW0/1DvZE=",
    "zh:15e42a6f8c6be77e0266edfb3765065c01e8fbcc8d75c794f1442f39cd9e6cfb",
    "zh:2387195e7c80bc3ba93162c5c755482828b309a275d170e0c329145894dc6cb2",
    "zh:27775d6f0b53a76c3f91689e553461a10ab2e07f7066ccb7cc0dce2cb8abf72f",
    "zh:28e77e1dfafe5881bc28bec76e22735e4be2dcde468a8f3f08f32a52c6f1938e",
    "zh:89b6571d33b6607499683b7b1fdfb95576ed08ab80539537c5460de1455df424",
    "zh:91cdad0f3a5cb4a82669703f6f017b07e434748cff9b8991432043c733ae50a7",
    "zh:a566611bc563c4e8ac843f6b6b868cf8dce2eccb908bd7605040b553983dc5e3",
    "zh:d4efb26732e5fbd4e6a5e4c10eea62628d669c9c76e52c6485417c1e0a60fd99",
    "zh:e87d8edc93920b75b88e7fb8d1a7941f2b7facc89931b72e4c74fcf137baee91",
    "zh:f173c9c66edb046715db10adce1d603fe989a3634b26bb81d556de3de548bd94",
  ]
}

provider "registry.opentofu.org/hashicorp/null" {
  version     = "3.2.3"
  constraints = ">= 3.0.0"
  hashes = [
    "h1:LN7WjQlMDIYGsXlum1kvMk5M8XzS2gzPTHmbEkxB6B0=",
    "zh:1d57d25084effd3fdfd902eca00020b34b1fb020253b84d7dd471301606015ac",
    "zh:65b7f9799b88464d9c2ec529713b7f52ea744275b61a8dc86cdedab1b2dcb933",
    "zh:80d3e9c95b7b4ae7c54005cd127cae82e5c53d2b7023ef24c147337bac9dadd9",
    "zh:841b60c07683e4bf456799ccd718896fdafdcc2c49252ae09967f2e74d8c8a03",
    "zh:8fa1c592a9c78222e35713c6edb3f1f818a4c6f3524a30a209f0a7e919827b68",
    "zh:bb795cc1429e09466840c09d39a28edf1db5070b1ec76822fc1173906a264572",
    "zh:da1784818a89bea29dfe660632f0060a7a843e4e564d74435fbeca002b0f7d2a",
    "zh:f409bf21b1cdaa6dac47cd79806f3d93f67e9507fe4dbf33b0165335f53bc2e1",
    "zh:fbea7a1ff84b430ba9594698e93196d81d03e4036de3d1cafccb2a96d5b38581",
    "zh:fbf0c84663a7e85881388d7d71ac862184f05fbf2d17ecf76bc5d3d7503ea260",
  ]
}

provider "registry.opentofu.org/hashicorp/random" {
  version     = "3.7.1"
  constraints = ">= 3.1.0, >= 3.6.0"
  hashes = [
    "h1:mV0IpNNTXywcEHuCRfvvjsaaVPPDFRrH7YQmd7/FD24=",
    "zh:1011387a5127d46e2bf0bd5124a8469506272b2110613d9eb80d178f94bd67a9",
    "zh:28785c36d6dc331d49e8bf6a30d4ba21ae4378f5d98c43c0aeb42f51efb2e42f",
    "zh:50fc0e52f0255950404681455420344a16263f91622bd481954606e6e3be9eb2",
    "zh:563f22c53f40e41cfffdcfac32a9292292c10582183c3f1dd85770cf806bfce9",
    "zh:586a5615898d369374d4bd7d70bc013cffe7553d3e14638f169a3f745665fee1",
    "zh:6275f6e5697993048ac088715484a9a5e919682651e098a5ac31e567216bf102",
    "zh:95a44bb3f012da1e036936d60df2d08f5942a96cb912fc23432d2ee050857527",
    "zh:a5fe6b0e586645a88d98738739fec40fd7ad83dbc63fe66ff6327aee2dc07f11",
    "zh:ea57886899b6baf466f3ff978f4482d2fd7fa049c42509cc819431375cddd5bd",
    "zh:f021cfbe23bdb32738f170c1ae736ffb769a2fa3dcafd0f9906155c2e21377e4",
  ]
}

provider "registry.opentofu.org/hashicorp/time" {
  version     = "0.13.0"
  constraints = ">= 0.9.0"
  hashes = [
    "h1:71sfVEFZDvqNdiprfsfOfBbpdyqoszvoOtdeuHznEYE=",
    "zh:0e0a5f820793f13d8553742fac6c234f76e65bd095703a81f8f9cad38361d6c6",
    "zh:11f2d5b5076d17814986886164bd4a4ce6448129baa529c21f658e949687f06f",
    "zh:1a59c8d7da0c8155a86dffb1716bb5f2884b221a13167d5e7bcffb2ac192ba3f",
    "zh:1e7abd01ef573294c0f2f1e2b30190c05a98afb7815d7a309fc10193bff4b4dd",
    "zh:3ca53edfae9adffe1ee9c040e83b076fde89d73e7b2e6dc2de19d408e3f52a40",
    "zh:5beb2cd0abe5376ff5e76d4f93d20c4740b333c1abc5ca72083e1cc85ffb29dd",
    "zh:a775d153ba932834401eb1d9151f462c1e49d47494152d282d3e6981b3e591c0",
    "zh:aac6802f60bf708172f09ead7a13177ab6a47f5a3eca458e935f422ed409f4a6",
    "zh:d4e5ad0041d752b94317093e8063e6b766982f647cfe3cc1a3f4a10930383357",
    "zh:fef228471c7223a558a1b6054ec7e8837526dc9787ba9da5dc6fbfa1c762cd1b",
  ]
}

provider "registry.opentofu.org/hashicorp/tls" {
  version     = "4.0.6"
  constraints = ">= 3.0.0"
  hashes = [
    "h1:0oXaBUFJ5bA0ED7OCajAOa9YSGTTpe8FyUFJP+zO6A4=",
    "zh:4b53b372767e5068d9bbfc89199201c1ae4283dde2f0c301974f8abb4215791f",
    "zh:5b4c308bd074c6d0bd560220e6ee10a9859ca9a1f29a59367b0477a740ff265e",
    "zh:674dd6bc85597677e160ee601d88b21c5a974759a658769812d2904bd94bc042",
    "zh:6ccc1c448349b56677ba66112aec7e0a58eb827f66209ca5f4077b81cce240fb",
    "zh:8aa6e13a5d722b74230937ea21e8b4994e53340d95b5691cf6cf3518b9f38e6e",
    "zh:8b27e55e4c7fa887774860113b95c8f7f68804b002fa47f0eb8e3a485997287e",
    "zh:a430b5a3e8753d8f61784de49e538ac4abed19fb665fccd8a10b55402fe9f076",
    "zh:b07c978c335ae9fc12f9c221629610775e4ae36691ed4e7ba258d275dd58a243",
    "zh:bbec8cb1efc84ee3026c793956a4a4cd0ece20b89d2d4f7d954c68e7f6d596d0",
    "zh:e684e247424188dc3b500a543b1a8046d1c0ec08c2a90aedca0c4f6bb56bedbd",
  ]
}
