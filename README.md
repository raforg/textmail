# README

*textmail* - Mail filter to replace MS Word/HTML attachments with plain text

# Description

*textmail* filters a mail message or mbox file, replacing MS Word, MS Excel,
HTML, RTF and PDF attachments with the plain text contained therein. By
default, the following attachments are also deleted: image, audio, video,
and MS Windows executables. MS `winmail.dat` attachments are replaced by any
attachments contained therein which are then replaced by text or deleted in
the same fashion. Any of these actions can be suppressed with command line
options. Mail headers can also be selectively deleted.

This is useful for increasing the accessibility of mail messages (by
reducing their dependence on proprietary file formats), for dramatically
reducing their size (and the time it takes to download them and the time it
takes to read them), and for dramatically reducing the risk of mail-borne
viruses). Its intended use is to reduce the size of a personal email archive
but it could also be useful as a pre-processor for mailing lists. This is
more friendly than a strict "No Attachments" or "No HTML" mailing list
policy.

*textmail* is freely available under the terms of the [GNU General Public
License](https://www.gnu.org/licenses/), either version 2 of the License, or
(at your option) any later version.

# Features

  * **Translation to plain text**

    The following documents are translated into plain text: MS Word,
    MS Excel, RTF, HTML and PDF.

  * **Deletion of large attachments**

    Image, audio and video attachments are deleted by default.

  * **Elimination of mail-borne viruses**

    MS Windows executable attachments are deleted by default.

  * **Translation of `winmail.dat` attachments**

    MS TNEF (i.e. `winmail.dat`) attachments are unpacked
    by default and replaced by any attachments contained therein which
    are then replaced by text or deleted as required.

  * **Deletion of binary attachments**

    Additionally, all `application/octet-stream` or all
    `application/*` attachments can be deleted.

  * **Deletion of unwanted mail headers**

    Headers can be deleted selectively by providing prefixes (e.g. `X-`).

  * **Robust**

    If it is impossible to translate an attachment, you have the
    choice of leaving the original attachment intact, or of
    discarding it in favour of the empty text translation.

# Requirements

*textmail* is written in Perl and executes several external
programs. It should run on any system with the following software:

  - perl
  - docx2txt
  - antiword
  - catdoc
  - xlsx2csv
  - xls2csv
  - pdftotext
  - lynx
  - mktemp

*textmail* does not require any non-standard Perl modules.

# Documentation

There is a manual entry:

  - [textmail(1)](http://raf.org/textmail/manpages/textmail.1.html) - the *textmail(1)* manpage

--------------------------------------------------------------------------------

    URL: https://raf.org/textmail
    GIT: https://github.com/raforg/textmail
    GIT: https://codeberg.org/raforg/textmail
    Date: 20200625
    Author: raf <raf@raf.org>

