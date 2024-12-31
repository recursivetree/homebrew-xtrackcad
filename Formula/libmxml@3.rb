class LibmxmlAT3 < Formula
  desc "Tiny XML library"
  homepage "https://www.msweet.org/mxml"
  url "https://github.com/michaelrsweet/mxml/releases/download/v3.3.1/mxml-3.3.1.tar.gz"
  sha256 "0c663ed1fe393b5619f80101798202eea43534abd7c8aff389022fd8c1dacc32"
  license "Apache-2.0"

  depends_on "pkgconf" => :test

  def install
    system "./configure", "--enable-shared", *std_configure_args
    system "make"
    system "make", "install"
  end

  test do
    (testpath/"test.c").write <<~C
      #include <mxml.h>

      int main()
      {
        FILE *fp;
        mxml_node_t *tree;

        fp = fopen("test.xml", "r");
        tree = mxmlLoadFile(NULL, NULL, fp);
        fclose(fp);
      }
    C

    (testpath/"test.xml").write <<~XML
      <?xml version="1.0" encoding="UTF-8"?>
      <test>
        <text>I'm an XML document.</text>
      </test>
    XML

    flags = shell_output("pkgconf --cflags --libs mxml").chomp.split
    system ENV.cc, "test.c", "-o", "test", *flags
    system "./test"
  end
end
