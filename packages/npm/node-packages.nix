# This file has been generated by node2nix 1.11.1. Do not edit!

{nodeEnv, fetchurl, fetchgit, nix-gitignore, stdenv, lib, globalBuildInputs ? []}:

let
  sources = {
    "@grpc/grpc-js-1.12.2" = {
      name = "_at_grpc_slash_grpc-js";
      packageName = "@grpc/grpc-js";
      version = "1.12.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/@grpc/grpc-js/-/grpc-js-1.12.2.tgz";
        sha512 = "bgxdZmgTrJZX50OjyVwz3+mNEnCTNkh3cIqGPWVNeW9jX6bn1ZkU80uPd+67/ZpIJIjRQ9qaHCjhavyoWYxumg==";
      };
    };
    "@grpc/proto-loader-0.7.13" = {
      name = "_at_grpc_slash_proto-loader";
      packageName = "@grpc/proto-loader";
      version = "0.7.13";
      src = fetchurl {
        url = "https://registry.npmjs.org/@grpc/proto-loader/-/proto-loader-0.7.13.tgz";
        sha512 = "AiXO/bfe9bmxBjxxtYxFAXGZvMaN5s8kO+jBHAJCON8rJoB5YS/D6X7ZNc6XQkuHNmyl4CYaMI1fJ/Gn27RGGw==";
      };
    };
    "@informalsystems/quint-0.22.2" = {
      name = "_at_informalsystems_slash_quint";
      packageName = "@informalsystems/quint";
      version = "0.22.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/@informalsystems/quint/-/quint-0.22.2.tgz";
        sha512 = "o8Og6+QSxvwSMai3auAdu8+xi4sBYU9ZSfhLXFY/gQvdc/Da4FkqNwRRJaFOyf1YlGnH0VVzTgm/HQPaqbJZzw==";
      };
    };
    "@js-sdsl/ordered-map-4.4.2" = {
      name = "_at_js-sdsl_slash_ordered-map";
      packageName = "@js-sdsl/ordered-map";
      version = "4.4.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/@js-sdsl/ordered-map/-/ordered-map-4.4.2.tgz";
        sha512 = "iUKgm52T8HOE/makSxjqoWhe95ZJA1/G1sYsGev2JDKUSS14KAgg1LHb+Ba+IPow0xflbnSkOsZcO08C7w1gYw==";
      };
    };
    "@octokit/endpoint-9.0.5" = {
      name = "_at_octokit_slash_endpoint";
      packageName = "@octokit/endpoint";
      version = "9.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/@octokit/endpoint/-/endpoint-9.0.5.tgz";
        sha512 = "ekqR4/+PCLkEBF6qgj8WqJfvDq65RH85OAgrtnVp1mSxaXF03u2xW/hUdweGS5654IlC0wkNYC18Z50tSYTAFw==";
      };
    };
    "@octokit/openapi-types-22.2.0" = {
      name = "_at_octokit_slash_openapi-types";
      packageName = "@octokit/openapi-types";
      version = "22.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@octokit/openapi-types/-/openapi-types-22.2.0.tgz";
        sha512 = "QBhVjcUa9W7Wwhm6DBFu6ZZ+1/t/oYxqc2tp81Pi41YNuJinbFRx8B133qVOrAaBbF7D/m0Et6f9/pZt9Rc+tg==";
      };
    };
    "@octokit/request-8.4.0" = {
      name = "_at_octokit_slash_request";
      packageName = "@octokit/request";
      version = "8.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@octokit/request/-/request-8.4.0.tgz";
        sha512 = "9Bb014e+m2TgBeEJGEbdplMVWwPmL1FPtggHQRkV+WVsMggPtEkLKPlcVYm/o8xKLkpJ7B+6N8WfQMtDLX2Dpw==";
      };
    };
    "@octokit/request-error-5.1.0" = {
      name = "_at_octokit_slash_request-error";
      packageName = "@octokit/request-error";
      version = "5.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@octokit/request-error/-/request-error-5.1.0.tgz";
        sha512 = "GETXfE05J0+7H2STzekpKObFe765O5dlAKUTLNGeH+x47z7JjXHfsHKo5z21D/o/IOZTUEI6nyWyR+bZVP/n5Q==";
      };
    };
    "@octokit/types-13.6.1" = {
      name = "_at_octokit_slash_types";
      packageName = "@octokit/types";
      version = "13.6.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@octokit/types/-/types-13.6.1.tgz";
        sha512 = "PHZE9Z+kWXb23Ndik8MKPirBPziOc0D2/3KH1P+6jK5nGWe96kadZuE4jev2/Jq7FvIfTlT2Ltg8Fv2x1v0a5g==";
      };
    };
    "@protobufjs/aspromise-1.1.2" = {
      name = "_at_protobufjs_slash_aspromise";
      packageName = "@protobufjs/aspromise";
      version = "1.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/@protobufjs/aspromise/-/aspromise-1.1.2.tgz";
        sha512 = "j+gKExEuLmKwvz3OgROXtrJ2UG2x8Ch2YZUxahh+s1F2HZ+wAceUNLkvy6zKCPVRkU++ZWQrdxsUeQXmcg4uoQ==";
      };
    };
    "@protobufjs/base64-1.1.2" = {
      name = "_at_protobufjs_slash_base64";
      packageName = "@protobufjs/base64";
      version = "1.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/@protobufjs/base64/-/base64-1.1.2.tgz";
        sha512 = "AZkcAA5vnN/v4PDqKyMR5lx7hZttPDgClv83E//FMNhR2TMcLUhfRUBHCmSl0oi9zMgDDqRUJkSxO3wm85+XLg==";
      };
    };
    "@protobufjs/codegen-2.0.4" = {
      name = "_at_protobufjs_slash_codegen";
      packageName = "@protobufjs/codegen";
      version = "2.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@protobufjs/codegen/-/codegen-2.0.4.tgz";
        sha512 = "YyFaikqM5sH0ziFZCN3xDC7zeGaB/d0IUb9CATugHWbd1FRFwWwt4ld4OYMPWu5a3Xe01mGAULCdqhMlPl29Jg==";
      };
    };
    "@protobufjs/eventemitter-1.1.0" = {
      name = "_at_protobufjs_slash_eventemitter";
      packageName = "@protobufjs/eventemitter";
      version = "1.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@protobufjs/eventemitter/-/eventemitter-1.1.0.tgz";
        sha512 = "j9ednRT81vYJ9OfVuXG6ERSTdEL1xVsNgqpkxMsbIabzSo3goCjDIveeGv5d03om39ML71RdmrGNjG5SReBP/Q==";
      };
    };
    "@protobufjs/fetch-1.1.0" = {
      name = "_at_protobufjs_slash_fetch";
      packageName = "@protobufjs/fetch";
      version = "1.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@protobufjs/fetch/-/fetch-1.1.0.tgz";
        sha512 = "lljVXpqXebpsijW71PZaCYeIcE5on1w5DlQy5WH6GLbFryLUrBD4932W/E2BSpfRJWseIL4v/KPgBFxDOIdKpQ==";
      };
    };
    "@protobufjs/float-1.0.2" = {
      name = "_at_protobufjs_slash_float";
      packageName = "@protobufjs/float";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/@protobufjs/float/-/float-1.0.2.tgz";
        sha512 = "Ddb+kVXlXst9d+R9PfTIxh1EdNkgoRe5tOX6t01f1lYWOvJnSPDBlG241QLzcyPdoNTsblLUdujGSE4RzrTZGQ==";
      };
    };
    "@protobufjs/inquire-1.1.0" = {
      name = "_at_protobufjs_slash_inquire";
      packageName = "@protobufjs/inquire";
      version = "1.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@protobufjs/inquire/-/inquire-1.1.0.tgz";
        sha512 = "kdSefcPdruJiFMVSbn801t4vFK7KB/5gd2fYvrxhuJYg8ILrmn9SKSX2tZdV6V+ksulWqS7aXjBcRXl3wHoD9Q==";
      };
    };
    "@protobufjs/path-1.1.2" = {
      name = "_at_protobufjs_slash_path";
      packageName = "@protobufjs/path";
      version = "1.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/@protobufjs/path/-/path-1.1.2.tgz";
        sha512 = "6JOcJ5Tm08dOHAbdR3GrvP+yUUfkjG5ePsHYczMFLq3ZmMkAD98cDgcT2iA1lJ9NVwFd4tH/iSSoe44YWkltEA==";
      };
    };
    "@protobufjs/pool-1.1.0" = {
      name = "_at_protobufjs_slash_pool";
      packageName = "@protobufjs/pool";
      version = "1.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@protobufjs/pool/-/pool-1.1.0.tgz";
        sha512 = "0kELaGSIDBKvcgS4zkjz1PeddatrjYcmMWOlAuAPwAeccUrPHdUqo/J6LiymHHEiJT5NrF1UVwxY14f+fy4WQw==";
      };
    };
    "@protobufjs/utf8-1.1.0" = {
      name = "_at_protobufjs_slash_utf8";
      packageName = "@protobufjs/utf8";
      version = "1.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@protobufjs/utf8/-/utf8-1.1.0.tgz";
        sha512 = "Vvn3zZrhQZkkBE8LSuW3em98c0FwgO4nxzv6OdSxPKJIEKY2bGbHn+mhGIPerzI4twdxaP8/0+06HBpwf345Lw==";
      };
    };
    "@sweet-monads/either-3.2.0" = {
      name = "_at_sweet-monads_slash_either";
      packageName = "@sweet-monads/either";
      version = "3.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@sweet-monads/either/-/either-3.2.0.tgz";
        sha512 = "n+nR0b60GRTKb+D76qhTf4NEBXU9zfpigYYEtKtSYbV+5+i5gxr9jFd64pYkY2O7hVsb/G7nspbAeFni/i1ltA==";
      };
    };
    "@sweet-monads/interfaces-3.3.0" = {
      name = "_at_sweet-monads_slash_interfaces";
      packageName = "@sweet-monads/interfaces";
      version = "3.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@sweet-monads/interfaces/-/interfaces-3.3.0.tgz";
        sha512 = "66akGvjPD4lizQy+w4JSltJilc2w/QPdw8lPAniLJGHwyjmrw9xMJLx76Q/GDnbCU59Werses4aZJLWOlJrL5A==";
      };
    };
    "@sweet-monads/maybe-3.2.0" = {
      name = "_at_sweet-monads_slash_maybe";
      packageName = "@sweet-monads/maybe";
      version = "3.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@sweet-monads/maybe/-/maybe-3.2.0.tgz";
        sha512 = "/t+K0D/kBfkYOkZaePEsrK868at0M9UIEVgehcM0xscrCSZhKWGteE41vl2XJQqh8WyiFo/mZ5y7eAPSYzS+pg==";
      };
    };
    "@types/line-column-1.0.2" = {
      name = "_at_types_slash_line-column";
      packageName = "@types/line-column";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/line-column/-/line-column-1.0.2.tgz";
        sha512 = "099oFQmp/Tlf20xW5XI5R4F69N6lF/zQ09XDzc3R5BOLFlqIotgKoNIyj0HD4fQLWcGDreDJv8k/BkLJscrDrw==";
      };
    };
    "@types/lodash-4.17.10" = {
      name = "_at_types_slash_lodash";
      packageName = "@types/lodash";
      version = "4.17.10";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/lodash/-/lodash-4.17.10.tgz";
        sha512 = "YpS0zzoduEhuOWjAotS6A5AVCva7X4lVlYLF0FYHAY9sdraBfnatttHItlWeZdGhuEkf+OzMNg2ZYAx8t+52uQ==";
      };
    };
    "@types/lodash.clonedeep-4.5.0" = {
      name = "_at_types_slash_lodash.clonedeep";
      packageName = "@types/lodash.clonedeep";
      version = "4.5.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/lodash.clonedeep/-/lodash.clonedeep-4.5.0.tgz";
        sha512 = "IHijjFVPJTvzvrNPz+6nQy5lZQb7uh807RfTIEaQBrZXrIGjZy0L2dEb3hju34J0eqbXLCY6Hub/g81Jl4pGCA==";
      };
    };
    "@types/node-22.7.5" = {
      name = "_at_types_slash_node";
      packageName = "@types/node";
      version = "22.7.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/node/-/node-22.7.5.tgz";
        sha512 = "jML7s2NAzMWc//QSJ1a3prpk78cOPchGvXJsC3C6R6PSMoooztvRVQEz89gmBTBY1SPMaqo5teB4uNHPdetShQ==";
      };
    };
    "@types/seedrandom-3.0.8" = {
      name = "_at_types_slash_seedrandom";
      packageName = "@types/seedrandom";
      version = "3.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/@types/seedrandom/-/seedrandom-3.0.8.tgz";
        sha512 = "TY1eezMU2zH2ozQoAFAQFOPpvP15g+ZgSfTZt31AUUH/Rxtnz3H+A/Sv1Snw2/amp//omibc+AEkTaA8KUeOLQ==";
      };
    };
    "ansi-regex-5.0.1" = {
      name = "ansi-regex";
      packageName = "ansi-regex";
      version = "5.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz";
        sha512 = "quJQXlTSUGL2LH9SUXo8VwsY4soanhgo6LNSm84E1LBcE8s3O0wpdiRzyR9z/ZZJMlMWv37qOOb9pdJlMUEKFQ==";
      };
    };
    "ansi-styles-4.3.0" = {
      name = "ansi-styles";
      packageName = "ansi-styles";
      version = "4.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.3.0.tgz";
        sha512 = "zbB9rCJAT1rbjiVDb2hqKFHNYLxgtk8NURxZ3IZwD3F6NtxbXZQCnnSi1Lkx+IDohdPlFp222wVALIheZJQSEg==";
      };
    };
    "antlr4ts-0.5.0-dev" = {
      name = "antlr4ts";
      packageName = "antlr4ts";
      version = "0.5.0-dev";
      src = fetchurl {
        url = "https://registry.npmjs.org/antlr4ts/-/antlr4ts-0.5.0-dev.tgz";
        sha512 = "FXZRGC53ZejWLOMzxJ6IpgmGYNzBYeaoN5FBQe2Y6+iEA+JFNZz+J67TF84ajksmzVX8BUi+Ytx7oih+BWtA8A==";
      };
    };
    "bignumber.js-9.1.2" = {
      name = "bignumber.js";
      packageName = "bignumber.js";
      version = "9.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/bignumber.js/-/bignumber.js-9.1.2.tgz";
        sha512 = "2/mKyZH9K85bzOEfhXDBFZTGd1CTs+5IHpeFQo9luiBG7hghdC851Pj2WAhb6E3R6b9tZj/XKhbg4fum+Kepug==";
      };
    };
    "buffer-from-1.1.2" = {
      name = "buffer-from";
      packageName = "buffer-from";
      version = "1.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.2.tgz";
        sha512 = "E+XQCRwSbaaiChtv6k6Dwgc+bx+Bs6vuKJHHl5kox/BaKbhiXzqQOwK4cO22yElGp2OCmjwVhT3HmxgyPGnJfQ==";
      };
    };
    "chalk-4.1.2" = {
      name = "chalk";
      packageName = "chalk";
      version = "4.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/chalk/-/chalk-4.1.2.tgz";
        sha512 = "oKnbhFyRIXpUuez8iBMmyEa4nbj4IOQyuhc/wy9kY7/WVPcwIO9VA668Pu8RkO7+0G76SLROeyw9CpQ061i4mA==";
      };
    };
    "chownr-2.0.0" = {
      name = "chownr";
      packageName = "chownr";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/chownr/-/chownr-2.0.0.tgz";
        sha512 = "bIomtDF5KGpdogkLd9VspvFzk9KfpyyGlS8YFVZl7TGPBHL5snIOnxeshwVgPteQ9b4Eydl+pVbIyE1DcvCWgQ==";
      };
    };
    "cli-progress-3.12.0" = {
      name = "cli-progress";
      packageName = "cli-progress";
      version = "3.12.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/cli-progress/-/cli-progress-3.12.0.tgz";
        sha512 = "tRkV3HJ1ASwm19THiiLIXLO7Im7wlTuKnvkYaTkyoAPefqjNg7W7DHKUlGRxy9vxDvbyCYQkQozvptuMkGCg8A==";
      };
    };
    "cliui-8.0.1" = {
      name = "cliui";
      packageName = "cliui";
      version = "8.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/cliui/-/cliui-8.0.1.tgz";
        sha512 = "BSeNnyus75C4//NQ9gQt1/csTXyo/8Sb+afLAkzAptFuMsod9HFokGNudZpi/oQV73hnVK+sR+5PVRMd+Dr7YQ==";
      };
    };
    "color-convert-2.0.1" = {
      name = "color-convert";
      packageName = "color-convert";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz";
        sha512 = "RRECPsj7iu/xb5oKYcsFHSppFNnsj/52OVTRKb4zP5onXwVF3zVmmToNcOfGC+CRDpfK/U584fMg38ZHCaElKQ==";
      };
    };
    "color-name-1.1.4" = {
      name = "color-name";
      packageName = "color-name";
      version = "1.1.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz";
        sha512 = "dOy+3AuW3a2wNbZHIuMZpTcgjGuLU/uBL/ubcZF9OXbDo8ff4O8yVp5Bf0efS8uEoYo5q4Fx7dY9OgQGXgAsQA==";
      };
    };
    "deprecation-2.3.1" = {
      name = "deprecation";
      packageName = "deprecation";
      version = "2.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/deprecation/-/deprecation-2.3.1.tgz";
        sha512 = "xmHIy4F3scKVwMsQ4WnVaS8bHOx0DmVwRywosKhaILI0ywMDWPtBSku2HNxRvF7jtwDRsoEwYQSfbxj8b7RlJQ==";
      };
    };
    "emoji-regex-8.0.0" = {
      name = "emoji-regex";
      packageName = "emoji-regex";
      version = "8.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz";
        sha512 = "MSjYzcWNOA0ewAHpz0MxpYFvwg6yjy1NG3xteoqz644VCo/RPgnr1/GGt+ic3iJTzQ8Eu3TdM14SawnVUmGE6A==";
      };
    };
    "eol-0.9.1" = {
      name = "eol";
      packageName = "eol";
      version = "0.9.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/eol/-/eol-0.9.1.tgz";
        sha512 = "Ds/TEoZjwggRoz/Q2O7SE3i4Jm66mqTDfmdHdq/7DKVk3bro9Q8h6WdXKdPqFLMoqxrDK5SVRzHVPOS6uuGtrg==";
      };
    };
    "escalade-3.2.0" = {
      name = "escalade";
      packageName = "escalade";
      version = "3.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/escalade/-/escalade-3.2.0.tgz";
        sha512 = "WUj2qlxaQtO4g6Pq5c29GTcWGDyd8itL8zTlipgECz3JesAiiOKotd8JU6otB3PACgG6xkJUyVhboMS+bje/jA==";
      };
    };
    "fs-minipass-2.1.0" = {
      name = "fs-minipass";
      packageName = "fs-minipass";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/fs-minipass/-/fs-minipass-2.1.0.tgz";
        sha512 = "V/JgOLFCS+R6Vcq0slCuaeWEdNC3ouDlJMNIsacH2VtALiu9mV4LPrHc5cDl8k5aw6J8jwgWWpiTo5RYhmIzvg==";
      };
    };
    "get-caller-file-2.0.5" = {
      name = "get-caller-file";
      packageName = "get-caller-file";
      version = "2.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/get-caller-file/-/get-caller-file-2.0.5.tgz";
        sha512 = "DyFP3BM/3YHTQOCUL/w0OZHR0lpKeGrxotcHWcqNEdnltqFwXVfhEBQ94eIo34AfQpo0rGki4cyIiftY06h2Fg==";
      };
    };
    "has-flag-4.0.0" = {
      name = "has-flag";
      packageName = "has-flag";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/has-flag/-/has-flag-4.0.0.tgz";
        sha512 = "EykJT/Q1KjTWctppgIAgfSO0tKVuZUjhgMr17kqTumMl6Afv3EISleU7qZUzoXDFTAHTDC4NOoG/ZxU3EvlMPQ==";
      };
    };
    "immutable-4.3.7" = {
      name = "immutable";
      packageName = "immutable";
      version = "4.3.7";
      src = fetchurl {
        url = "https://registry.npmjs.org/immutable/-/immutable-4.3.7.tgz";
        sha512 = "1hqclzwYwjRDFLjcFxOM5AYkkG0rpFPpr1RLPMEuGczoS7YA8gLhy8SWXYRAA/XwfEHpfo3cw5JGioS32fnMRw==";
      };
    };
    "is-fullwidth-code-point-3.0.0" = {
      name = "is-fullwidth-code-point";
      packageName = "is-fullwidth-code-point";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz";
        sha512 = "zymm5+u+sCsSWyD9qNaejV3DFvhCKclKdizYaJUuHA83RLjb7nSuGnddCHGv0hk+KY7BMAlsWeK4Ueg6EV6XQg==";
      };
    };
    "isarray-1.0.0" = {
      name = "isarray";
      packageName = "isarray";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/isarray/-/isarray-1.0.0.tgz";
        sha512 = "VLghIWNM6ELQzo7zwmcg0NmTVyWKYjvIeM83yjp0wRDTmUnrM678fQbcKBo6n2CJEF0szoG//ytg+TKla89ALQ==";
      };
    };
    "isobject-2.1.0" = {
      name = "isobject";
      packageName = "isobject";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/isobject/-/isobject-2.1.0.tgz";
        sha512 = "+OUdGJlgjOBZDfxnDjYYG6zp487z0JGNQq3cYQYg5f5hKR+syHMsaztzGeml/4kGG55CSpKSpWTY+jYGgsHLgA==";
      };
    };
    "json-bigint-1.0.0" = {
      name = "json-bigint";
      packageName = "json-bigint";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/json-bigint/-/json-bigint-1.0.0.tgz";
        sha512 = "SiPv/8VpZuWbvLSMtTDU8hEfrZWg/mH/nV/b4o0CYbSxu1UIQPLdwKOCIyLQX+VIPO5vrLX3i8qtqFyhdPSUSQ==";
      };
    };
    "line-column-1.0.2" = {
      name = "line-column";
      packageName = "line-column";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/line-column/-/line-column-1.0.2.tgz";
        sha512 = "Ktrjk5noGYlHsVnYWh62FLVs4hTb8A3e+vucNZMgPeAOITdshMSgv4cCZQeRDjm7+goqmo6+liZwTXo+U3sVww==";
      };
    };
    "lodash-4.17.21" = {
      name = "lodash";
      packageName = "lodash";
      version = "4.17.21";
      src = fetchurl {
        url = "https://registry.npmjs.org/lodash/-/lodash-4.17.21.tgz";
        sha512 = "v2kDEe57lecTulaDIuNTPy3Ry4gLGJ6Z1O3vE1krgXZNrsQ+LFTGHVxVjcXPs17LhbZVGedAJv8XZ1tvj5FvSg==";
      };
    };
    "lodash.camelcase-4.3.0" = {
      name = "lodash.camelcase";
      packageName = "lodash.camelcase";
      version = "4.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/lodash.camelcase/-/lodash.camelcase-4.3.0.tgz";
        sha512 = "TwuEnCnxbc3rAvhf/LbG7tJUDzhqXyFnv3dtzLOPgCG/hODL7WFnsbwktkD7yUV0RrreP/l1PALq/YSg6VvjlA==";
      };
    };
    "lodash.clonedeep-4.5.0" = {
      name = "lodash.clonedeep";
      packageName = "lodash.clonedeep";
      version = "4.5.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/lodash.clonedeep/-/lodash.clonedeep-4.5.0.tgz";
        sha512 = "H5ZhCF25riFd9uB5UCkVKo61m3S/xZk1x4wA6yp/L3RFP6Z/eHH1ymQcGLo7J3GMPfm0V/7m1tryHuGVxpqEBQ==";
      };
    };
    "lodash.isequal-4.5.0" = {
      name = "lodash.isequal";
      packageName = "lodash.isequal";
      version = "4.5.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/lodash.isequal/-/lodash.isequal-4.5.0.tgz";
        sha512 = "pDo3lu8Jhfjqls6GkMgpahsF9kCyayhgykjyLMNFTKWrpVdAQtYyB4muAMWozBB4ig/dtWAmsMxLEI8wuz+DYQ==";
      };
    };
    "long-5.2.3" = {
      name = "long";
      packageName = "long";
      version = "5.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/long/-/long-5.2.3.tgz";
        sha512 = "lcHwpNoggQTObv5apGNCTdJrO69eHOZMi4BNC+rTLER8iHAqGrUVeLh/irVIM7zTw2bOXA8T6uNPeujwOLg/2Q==";
      };
    };
    "minipass-3.3.6" = {
      name = "minipass";
      packageName = "minipass";
      version = "3.3.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/minipass/-/minipass-3.3.6.tgz";
        sha512 = "DxiNidxSEK+tHG6zOIklvNOwm3hvCrbUrdtzY74U6HKTJxvIDfOUL5W5P2Ghd3DTkhhKPYGqeNUIh5qcM4YBfw==";
      };
    };
    "minipass-5.0.0" = {
      name = "minipass";
      packageName = "minipass";
      version = "5.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/minipass/-/minipass-5.0.0.tgz";
        sha512 = "3FnjYuehv9k6ovOEbyOswadCDPX1piCfhV8ncmYtHOjuPwylVWsghTLo7rabjC3Rx5xD4HDx8Wm1xnMF7S5qFQ==";
      };
    };
    "minizlib-2.1.2" = {
      name = "minizlib";
      packageName = "minizlib";
      version = "2.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/minizlib/-/minizlib-2.1.2.tgz";
        sha512 = "bAxsR8BVfj60DWXHE3u30oHzfl4G7khkSuPW+qvpd7jFRHm7dLxOjUk1EHACJ/hxLY8phGJ0YhYHZo7jil7Qdg==";
      };
    };
    "mkdirp-1.0.4" = {
      name = "mkdirp";
      packageName = "mkdirp";
      version = "1.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/mkdirp/-/mkdirp-1.0.4.tgz";
        sha512 = "vVqVZQyf3WLx2Shd0qJ9xuvqgAyKPLAiqITEtqW0oIUjzo3PePDd6fW9iFz30ef7Ysp/oiWqbhszeGWW2T6Gzw==";
      };
    };
    "once-1.4.0" = {
      name = "once";
      packageName = "once";
      version = "1.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/once/-/once-1.4.0.tgz";
        sha512 = "lNaJgI+2Q5URQBkccEKHTQOPaXdUxnZZElQTZY0MFUAuaEqe1E+Nyvgdz/aIyNi6Z9MzO5dv1H8n58/GELp3+w==";
      };
    };
    "protobufjs-7.4.0" = {
      name = "protobufjs";
      packageName = "protobufjs";
      version = "7.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/protobufjs/-/protobufjs-7.4.0.tgz";
        sha512 = "mRUWCc3KUU4w1jU8sGxICXH/gNS94DvI1gxqDvBzhj1JpcsimQkYiOJfwsPUykUI5ZaspFbSgmBLER8IrQ3tqw==";
      };
    };
    "require-directory-2.1.1" = {
      name = "require-directory";
      packageName = "require-directory";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/require-directory/-/require-directory-2.1.1.tgz";
        sha512 = "fGxEI7+wsG9xrvdjsrlmL22OMTTiHRwAMroiEeMgq8gzoLC/PQr7RsRDSTLUg/bZAZtF+TVIkHc6/4RIKrui+Q==";
      };
    };
    "seedrandom-3.0.5" = {
      name = "seedrandom";
      packageName = "seedrandom";
      version = "3.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/seedrandom/-/seedrandom-3.0.5.tgz";
        sha512 = "8OwmbklUNzwezjGInmZ+2clQmExQPvomqjL7LFqOYqtmuxRgQYqOD3mHaU+MvZn5FLUeVxVfQjwLZW/n/JFuqg==";
      };
    };
    "source-map-0.6.1" = {
      name = "source-map";
      packageName = "source-map";
      version = "0.6.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz";
        sha512 = "UjgapumWlbMhkBgzT7Ykc5YXUT46F0iKu8SGXq0bcwP5dz/h0Plj6enJqjz1Zbq2l5WaqYnrVbwWOWMyF3F47g==";
      };
    };
    "source-map-support-0.5.21" = {
      name = "source-map-support";
      packageName = "source-map-support";
      version = "0.5.21";
      src = fetchurl {
        url = "https://registry.npmjs.org/source-map-support/-/source-map-support-0.5.21.tgz";
        sha512 = "uBHU3L3czsIyYXKX88fdrGovxdSCoTGDRZ6SYXtSRxLZUzHg5P/66Ht6uoUlHu9EZod+inXhKo3qQgwXUT/y1w==";
      };
    };
    "string-width-4.2.3" = {
      name = "string-width";
      packageName = "string-width";
      version = "4.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz";
        sha512 = "wKyQRQpjJ0sIp62ErSZdGsjMJWsap5oRNihHhu6G7JVO/9jIB6UyevL+tXuOqrng8j/cxKTWyWUwvSTriiZz/g==";
      };
    };
    "strip-ansi-6.0.1" = {
      name = "strip-ansi";
      packageName = "strip-ansi";
      version = "6.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz";
        sha512 = "Y38VPSHcqkFrCpFnQ9vuSXmquuv5oXOKpGeT6aGrr3o3Gc9AlVa6JBfUSOCnbxGGZF+/0ooI7KrPuUSztUdU5A==";
      };
    };
    "supports-color-7.2.0" = {
      name = "supports-color";
      packageName = "supports-color";
      version = "7.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/supports-color/-/supports-color-7.2.0.tgz";
        sha512 = "qpCAvRl9stuOHveKsn7HncJRvv501qIacKzQlO/+Lwxc9+0q2wLyv4Dfvt80/DPn2pqOBsJdDiogXGR9+OvwRw==";
      };
    };
    "tar-6.2.1" = {
      name = "tar";
      packageName = "tar";
      version = "6.2.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/tar/-/tar-6.2.1.tgz";
        sha512 = "DZ4yORTwrbTj/7MZYq2w+/ZFdI6OZ/f9SFHR+71gIVUZhOQPHzVCLpvRnPgyaMpfWxxk/4ONva3GQSyNIKRv6A==";
      };
    };
    "undici-types-6.19.8" = {
      name = "undici-types";
      packageName = "undici-types";
      version = "6.19.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/undici-types/-/undici-types-6.19.8.tgz";
        sha512 = "ve2KP6f/JnbPBFyobGHuerC9g1FYGn/F8n1LWTwNxCEzd6IfqTwUQcNXgEtmmQ6DlRrC1hrSrBnCZPokRrDHjw==";
      };
    };
    "universal-user-agent-6.0.1" = {
      name = "universal-user-agent";
      packageName = "universal-user-agent";
      version = "6.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/universal-user-agent/-/universal-user-agent-6.0.1.tgz";
        sha512 = "yCzhz6FN2wU1NiiQRogkTQszlQSlpWaw8SvVegAc+bDxbzHgh1vX8uIe8OYyMH6DwH+sdTJsgMl36+mSMdRJIQ==";
      };
    };
    "vscode-jsonrpc-6.0.0" = {
      name = "vscode-jsonrpc";
      packageName = "vscode-jsonrpc";
      version = "6.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-jsonrpc/-/vscode-jsonrpc-6.0.0.tgz";
        sha512 = "wnJA4BnEjOSyFMvjZdpiOwhSq9uDoK8e/kpRJDTaMYzwlkrhG1fwDIZI94CLsLzlCK5cIbMMtFlJlfR57Lavmg==";
      };
    };
    "vscode-languageserver-7.0.0" = {
      name = "vscode-languageserver";
      packageName = "vscode-languageserver";
      version = "7.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver/-/vscode-languageserver-7.0.0.tgz";
        sha512 = "60HTx5ID+fLRcgdHfmz0LDZAXYEV68fzwG0JWwEPBode9NuMYTIxuYXPg4ngO8i8+Ou0lM7y6GzaYWbiDL0drw==";
      };
    };
    "vscode-languageserver-protocol-3.16.0" = {
      name = "vscode-languageserver-protocol";
      packageName = "vscode-languageserver-protocol";
      version = "3.16.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-protocol/-/vscode-languageserver-protocol-3.16.0.tgz";
        sha512 = "sdeUoAawceQdgIfTI+sdcwkiK2KU+2cbEYA0agzM2uqaUy2UpnnGHtWTHVEtS0ES4zHU0eMFRGN+oQgDxlD66A==";
      };
    };
    "vscode-languageserver-textdocument-1.0.12" = {
      name = "vscode-languageserver-textdocument";
      packageName = "vscode-languageserver-textdocument";
      version = "1.0.12";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-textdocument/-/vscode-languageserver-textdocument-1.0.12.tgz";
        sha512 = "cxWNPesCnQCcMPeenjKKsOCKQZ/L6Tv19DTRIGuLWe32lyzWhihGVJ/rcckZXJxfdKCFvRLS3fpBIsV/ZGX4zA==";
      };
    };
    "vscode-languageserver-types-3.16.0" = {
      name = "vscode-languageserver-types";
      packageName = "vscode-languageserver-types";
      version = "3.16.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-types/-/vscode-languageserver-types-3.16.0.tgz";
        sha512 = "k8luDIWJWyenLc5ToFQQMaSrqCHiLwyKPHKPQZ5zz21vM+vIVUSvsRpcbiECH4WR88K2XZqc4ScRcZ7nk/jbeA==";
      };
    };
    "vscode-uri-3.0.8" = {
      name = "vscode-uri";
      packageName = "vscode-uri";
      version = "3.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-uri/-/vscode-uri-3.0.8.tgz";
        sha512 = "AyFQ0EVmsOZOlAnxoFOGOq1SQDWAB7C6aqMGS23svWAllfOaxbuFvcT8D1i8z3Gyn8fraVeZNNmN6e9bxxXkKw==";
      };
    };
    "wrap-ansi-7.0.0" = {
      name = "wrap-ansi";
      packageName = "wrap-ansi";
      version = "7.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-7.0.0.tgz";
        sha512 = "YVGIj2kamLSTxw6NsZjoBxfSwsn0ycdesmc4p+Q21c5zPuZ1pl+NfxVdxPtdHvmNVOQ6XSYG4AUtyt/Fi7D16Q==";
      };
    };
    "wrappy-1.0.2" = {
      name = "wrappy";
      packageName = "wrappy";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz";
        sha512 = "l4Sp/DRseor9wL6EvV2+TuQn63dMkPjZ/sp9XkghTEbV9KlPS1xUsZ3u7/IQO4wxtcFB4bgpQPRcR3QCvezPcQ==";
      };
    };
    "y18n-5.0.8" = {
      name = "y18n";
      packageName = "y18n";
      version = "5.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/y18n/-/y18n-5.0.8.tgz";
        sha512 = "0pfFzegeDWJHJIAmTLRP2DwHjdF5s7jo9tuztdQxAhINCdvS+3nGINqPd00AphqJR/0LhANUS6/+7SCb98YOfA==";
      };
    };
    "yallist-4.0.0" = {
      name = "yallist";
      packageName = "yallist";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz";
        sha512 = "3wdGidZyq5PB084XLES5TpOSRA3wjXAlIWMhum2kRcv/41Sn2emQ0dycQW4uZXLejwKvg6EsvbdlVL+FYEct7A==";
      };
    };
    "yargs-17.7.2" = {
      name = "yargs";
      packageName = "yargs";
      version = "17.7.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/yargs/-/yargs-17.7.2.tgz";
        sha512 = "7dSzzRQ++CKnNI/krKnYRV7JKKPUXMEh61soaHKg9mrWEhzFWhFnxPxGl+69cD1Ou63C13NUPCnmIcrvqCuM6w==";
      };
    };
    "yargs-parser-21.1.1" = {
      name = "yargs-parser";
      packageName = "yargs-parser";
      version = "21.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/yargs-parser/-/yargs-parser-21.1.1.tgz";
        sha512 = "tVpsJW7DdjecAiFpbIB1e3qxIQsE6NoPc5/eTdrbbIC4h0LVsWhnoa3g+m2HclBIujHzsxZ4VJVA+GUuc2/LBw==";
      };
    };
  };
in
{
  "@informalsystems/quint" = nodeEnv.buildNodePackage {
    name = "_at_informalsystems_slash_quint";
    packageName = "@informalsystems/quint";
    version = "0.22.2";
    src = fetchurl {
      url = "https://registry.npmjs.org/@informalsystems/quint/-/quint-0.22.2.tgz";
      sha512 = "o8Og6+QSxvwSMai3auAdu8+xi4sBYU9ZSfhLXFY/gQvdc/Da4FkqNwRRJaFOyf1YlGnH0VVzTgm/HQPaqbJZzw==";
    };
    dependencies = [
      sources."@grpc/grpc-js-1.12.2"
      sources."@grpc/proto-loader-0.7.13"
      sources."@js-sdsl/ordered-map-4.4.2"
      sources."@octokit/endpoint-9.0.5"
      sources."@octokit/openapi-types-22.2.0"
      sources."@octokit/request-8.4.0"
      sources."@octokit/request-error-5.1.0"
      sources."@octokit/types-13.6.1"
      sources."@protobufjs/aspromise-1.1.2"
      sources."@protobufjs/base64-1.1.2"
      sources."@protobufjs/codegen-2.0.4"
      sources."@protobufjs/eventemitter-1.1.0"
      sources."@protobufjs/fetch-1.1.0"
      sources."@protobufjs/float-1.0.2"
      sources."@protobufjs/inquire-1.1.0"
      sources."@protobufjs/path-1.1.2"
      sources."@protobufjs/pool-1.1.0"
      sources."@protobufjs/utf8-1.1.0"
      sources."@sweet-monads/either-3.2.0"
      sources."@sweet-monads/interfaces-3.3.0"
      sources."@sweet-monads/maybe-3.2.0"
      sources."@types/line-column-1.0.2"
      sources."@types/lodash-4.17.10"
      sources."@types/lodash.clonedeep-4.5.0"
      sources."@types/node-22.7.5"
      sources."@types/seedrandom-3.0.8"
      sources."ansi-regex-5.0.1"
      sources."ansi-styles-4.3.0"
      sources."antlr4ts-0.5.0-dev"
      sources."bignumber.js-9.1.2"
      sources."buffer-from-1.1.2"
      sources."chalk-4.1.2"
      sources."chownr-2.0.0"
      sources."cli-progress-3.12.0"
      sources."cliui-8.0.1"
      sources."color-convert-2.0.1"
      sources."color-name-1.1.4"
      sources."deprecation-2.3.1"
      sources."emoji-regex-8.0.0"
      sources."eol-0.9.1"
      sources."escalade-3.2.0"
      (sources."fs-minipass-2.1.0" // {
        dependencies = [
          sources."minipass-3.3.6"
        ];
      })
      sources."get-caller-file-2.0.5"
      sources."has-flag-4.0.0"
      sources."immutable-4.3.7"
      sources."is-fullwidth-code-point-3.0.0"
      sources."isarray-1.0.0"
      sources."isobject-2.1.0"
      sources."json-bigint-1.0.0"
      sources."line-column-1.0.2"
      sources."lodash-4.17.21"
      sources."lodash.camelcase-4.3.0"
      sources."lodash.clonedeep-4.5.0"
      sources."lodash.isequal-4.5.0"
      sources."long-5.2.3"
      sources."minipass-5.0.0"
      (sources."minizlib-2.1.2" // {
        dependencies = [
          sources."minipass-3.3.6"
        ];
      })
      sources."mkdirp-1.0.4"
      sources."once-1.4.0"
      sources."protobufjs-7.4.0"
      sources."require-directory-2.1.1"
      sources."seedrandom-3.0.5"
      sources."source-map-0.6.1"
      sources."source-map-support-0.5.21"
      sources."string-width-4.2.3"
      sources."strip-ansi-6.0.1"
      sources."supports-color-7.2.0"
      sources."tar-6.2.1"
      sources."undici-types-6.19.8"
      sources."universal-user-agent-6.0.1"
      sources."wrap-ansi-7.0.0"
      sources."wrappy-1.0.2"
      sources."y18n-5.0.8"
      sources."yallist-4.0.0"
      sources."yargs-17.7.2"
      sources."yargs-parser-21.1.1"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "Core tool for the Quint specification language";
      homepage = "https://github.com/informalsystems/quint";
      license = "Apache 2.0";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
  "@informalsystems/quint-language-server" = nodeEnv.buildNodePackage {
    name = "_at_informalsystems_slash_quint-language-server";
    packageName = "@informalsystems/quint-language-server";
    version = "0.14.6";
    src = fetchurl {
      url = "https://registry.npmjs.org/@informalsystems/quint-language-server/-/quint-language-server-0.14.6.tgz";
      sha512 = "/FXyG4DNxLwiAwuyzbrsd1A8ShNi6A8UTzJNKQoBOkdm1v/Z7G+2b/4zVHiOZ5RZVm5w6kYcYntidHfC/a8D9g==";
    };
    dependencies = [
      sources."@grpc/grpc-js-1.12.2"
      sources."@grpc/proto-loader-0.7.13"
      sources."@informalsystems/quint-0.22.2"
      sources."@js-sdsl/ordered-map-4.4.2"
      sources."@octokit/endpoint-9.0.5"
      sources."@octokit/openapi-types-22.2.0"
      sources."@octokit/request-8.4.0"
      sources."@octokit/request-error-5.1.0"
      sources."@octokit/types-13.6.1"
      sources."@protobufjs/aspromise-1.1.2"
      sources."@protobufjs/base64-1.1.2"
      sources."@protobufjs/codegen-2.0.4"
      sources."@protobufjs/eventemitter-1.1.0"
      sources."@protobufjs/fetch-1.1.0"
      sources."@protobufjs/float-1.0.2"
      sources."@protobufjs/inquire-1.1.0"
      sources."@protobufjs/path-1.1.2"
      sources."@protobufjs/pool-1.1.0"
      sources."@protobufjs/utf8-1.1.0"
      sources."@sweet-monads/either-3.2.0"
      sources."@sweet-monads/interfaces-3.3.0"
      sources."@sweet-monads/maybe-3.2.0"
      sources."@types/line-column-1.0.2"
      sources."@types/lodash-4.17.10"
      sources."@types/lodash.clonedeep-4.5.0"
      sources."@types/node-22.7.5"
      sources."@types/seedrandom-3.0.8"
      sources."ansi-regex-5.0.1"
      sources."ansi-styles-4.3.0"
      sources."antlr4ts-0.5.0-dev"
      sources."bignumber.js-9.1.2"
      sources."buffer-from-1.1.2"
      sources."chalk-4.1.2"
      sources."chownr-2.0.0"
      sources."cli-progress-3.12.0"
      sources."cliui-8.0.1"
      sources."color-convert-2.0.1"
      sources."color-name-1.1.4"
      sources."deprecation-2.3.1"
      sources."emoji-regex-8.0.0"
      sources."eol-0.9.1"
      sources."escalade-3.2.0"
      (sources."fs-minipass-2.1.0" // {
        dependencies = [
          sources."minipass-3.3.6"
        ];
      })
      sources."get-caller-file-2.0.5"
      sources."has-flag-4.0.0"
      sources."immutable-4.3.7"
      sources."is-fullwidth-code-point-3.0.0"
      sources."isarray-1.0.0"
      sources."isobject-2.1.0"
      sources."json-bigint-1.0.0"
      sources."line-column-1.0.2"
      sources."lodash-4.17.21"
      sources."lodash.camelcase-4.3.0"
      sources."lodash.clonedeep-4.5.0"
      sources."lodash.isequal-4.5.0"
      sources."long-5.2.3"
      sources."minipass-5.0.0"
      (sources."minizlib-2.1.2" // {
        dependencies = [
          sources."minipass-3.3.6"
        ];
      })
      sources."mkdirp-1.0.4"
      sources."once-1.4.0"
      sources."protobufjs-7.4.0"
      sources."require-directory-2.1.1"
      sources."seedrandom-3.0.5"
      sources."source-map-0.6.1"
      sources."source-map-support-0.5.21"
      sources."string-width-4.2.3"
      sources."strip-ansi-6.0.1"
      sources."supports-color-7.2.0"
      sources."tar-6.2.1"
      sources."undici-types-6.19.8"
      sources."universal-user-agent-6.0.1"
      sources."vscode-jsonrpc-6.0.0"
      sources."vscode-languageserver-7.0.0"
      sources."vscode-languageserver-protocol-3.16.0"
      sources."vscode-languageserver-textdocument-1.0.12"
      sources."vscode-languageserver-types-3.16.0"
      sources."vscode-uri-3.0.8"
      sources."wrap-ansi-7.0.0"
      sources."wrappy-1.0.2"
      sources."y18n-5.0.8"
      sources."yallist-4.0.0"
      sources."yargs-17.7.2"
      sources."yargs-parser-21.1.1"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "Language Server for the Quint specification language";
      homepage = "https://github.com/informalsystems/quint#readme";
      license = "Apache 2.0";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
}
