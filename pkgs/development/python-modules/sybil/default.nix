{ lib
, buildPythonApplication
, fetchPypi
, pytestCheckHook
, pythonOlder
}:

buildPythonApplication rec {
  pname = "sybil";
  version = "3.0.0";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    sha256 = "7692ed66e793e5e79ae6a70cf2cf861917ed48eaff0d8adf825e64d85820f251";
  };

  checkInputs = [
    pytestCheckHook
  ];

  disabledTests = [
    "test_modules_not_importable_unittest"
  ];

  pythonImportsCheck = [
    "sybil"
  ];

  meta = with lib; {
    description = "Automated testing for the examples in your documentation";
    homepage = "https://github.com/cjw296/sybil";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
