class Xtrkcad < Formula
  desc "Model Railway CAD program"
  homepage "https://sourceforge.net/projects/xtrkcad-fork/"
  url "https://downloads.sourceforge.net/project/xtrkcad-fork/XTrackCad/Version%205.3.0/xtrkcad-source-5.3.0GA.tar.gz"
  sha256 "e63c6ae4bb7a98cb1493a79653726364f552032470f92366e6c10faa36cc738c"
  license "GPL-2.0-only"

  depends_on "cmake" => :build

  depends_on "freeimage"
  depends_on "gtk+"
  depends_on "libzip"


  patch do
    url "https://yurix.ch/wpref.diff"
    sha256 "6dc10564abc7ca69863f58ca22cf6823b4328c8754a41cd0ebd88af7252674c6"
  end



  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "make", "-C", "build"
    system "make", "-C", "build", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test xtrkcad`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end