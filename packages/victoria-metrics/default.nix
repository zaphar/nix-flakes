{ lib, pkgs, src, version }:
with pkgs;
buildGo124Module rec {
  pname = "VictoriaMetrics";
  inherit version;

  inherit src;

  vendorHash = null;

  subPackages = [
    "app/victoria-metrics"
    "app/vmagent"
    "app/vmui"
    "app/vmauth"
    "app/vmbackup"
    "app/vmbackupmanager"
    "app/vmrestore"
    "app/vmalert-tool"
    "app/vmalert"
    "app/vminsert"
    "app/vmselect"
  ];

  postPatch = ''
    # main module (github.com/VictoriaMetrics/VictoriaMetrics) does not contain package
    # github.com/VictoriaMetrics/VictoriaMetrics/app/vmui/packages/vmui/web
    #
    # This appears to be some kind of test server for development purposes only.
    rm -f app/vmui/packages/vmui/web/{go.mod,main.go}

    # Increase timeouts in tests to prevent failure on heavily loaded builders
    substituteInPlace lib/storage/storage_test.go \
      --replace-warn "time.After(10 " "time.After(120 " \
      --replace-warn "time.NewTimer(30 " "time.NewTimer(120 " \
      --replace-warn "time.NewTimer(time.Second * 10)" "time.NewTimer(time.Second * 120)" \
  '';

  ldflags = [ "-s" "-w" "-X github.com/VictoriaMetrics/VictoriaMetrics/lib/buildinfo.Version=${version}" ];

  preCheck = ''
    # `lib/querytracer/tracer_test.go` expects `buildinfo.Version` to be unset
    export ldflags=''${ldflags//=${version}/=}
  '';

  __darwinAllowLocalNetworking = true;

  passthru.tests = { inherit (nixosTests) victoriametrics; };

  meta = with lib; {
    homepage = "https://victoriametrics.com/";
    description = "fast, cost-effective and scalable time series database, long-term remote storage for Prometheus";
    license = licenses.asl20;
    maintainers = with maintainers; [ yorickvp ivan ];
    changelog = "https://github.com/VictoriaMetrics/VictoriaMetrics/releases/tag/v${version}";
    mainProgram = "victoria-metrics";
  };
}
