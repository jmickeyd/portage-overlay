# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib unpacker eutils

DESCRIPTION="Vagrant is a tool for building complete development environments."
HOMEPAGE="http://www.vagrantup.com/"
SRC_URI_BASE="http://dl.bintray.com/mitchellh/vagrant/"
SRC_URI="x86? ( ${SRC_URI_BASE}/${PN/-bin/}_${PV}_i686.deb )
         amd64? ( ${SRC_URI_BASE}/${PN/-bin/}_${PV}_x86_64.deb )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="test strip mirror"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/opt/vagrant"
QA_PREBUILT="*"

src_install() {
    local version flapper

	dodir /opt/vagrant
	cp -ar ./* "${ED}opt/vagrant"

	make_wrapper vagrant /opt/vagrant/bin/vagrant
}
