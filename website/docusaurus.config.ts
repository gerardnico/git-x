import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';


const config: Config = {
    title: 'Giture',
    tagline: 'Git with features',
    // favicon: 'img/favicon.ico',

    // Future flags, see https://docusaurus.io/docs/api/docusaurus-config#future
    future: {
        v4: true, // Improve compatibility with the upcoming Docusaurus v4
    },

    // https://docusaurus.io/docs/api/docusaurus-config#deploymentBranch
    deploymentBranch: 'gh-pages',

    // works only in mdx
    customFields: {
        VERSION: "1.0.0",
    },

    // Set the production url of your site here
    url: 'https://tools.gerardnico.com',
    // Set the /<baseUrl>/ pathname under which your site is served
    // For GitHub pages deployment, it is often '/<projectName>/'
    baseUrl: '/giture',

    // GitHub pages deployment config.
    // If you aren't using GitHub pages, you don't need these.
    organizationName: 'gerardnico',
    projectName: 'giture',

    onBrokenLinks: 'throw',

    // Even if you don't use internationalization, you can use this field to set
    // useful metadata like html lang. For example, if your site is Chinese, you
    // may want to replace "en" with "zh-Hans".
    i18n: {
        defaultLocale: 'en',
        locales: ['en'],
    },

    presets: [
        [
            'classic',
            {
                docs: {
                    sidebarPath: './sidebars.ts',
                    // Please change this to your repo.
                    // Remove this to remove the "edit this page" links.
                    editUrl:
                        'https://github.com/gerardnico/giture/tree/main',
                },
                theme: {
                    customCss: './src/css/custom.css',
                },
            } satisfies Preset.Options,
        ],
    ],

    themeConfig: {
        // Replace with your project's social card
        // image: 'img/docusaurus-social-card.jpg',
        colorMode: {
            respectPrefersColorScheme: true,
        },
        navbar: {
            title: 'Giture',
            // logo: {
            //   alt: 'My Site Logo',
            //   src: 'img/logo.svg',
            // },
            items: [
                {
                    position: 'right',
                    label: 'Git Flow',
                    to: 'docs/git-flow'
                },
                {
                    position: 'right',
                    label: 'Git Backup',
                    to: 'docs/git-backup'
                },
                {
                    position: 'right',
                    label: 'Git Exec',
                    to: 'docs/git-exec'
                },
                {
                    href: 'https://github.com/gerardnico/giture',
                    label: 'GitHub',
                    position: 'right',
                },
            ],
        },
        footer: {
            style: 'dark',
            copyright: `Copyright © ${new Date().getFullYear()} gerardnico.com, Inc. Built with Docusaurus.`,
        },
        // https://docusaurus.io/docs/markdown-features/code-blocks
        prism: {
            theme: prismThemes.github,
            darkTheme: prismThemes.dracula,
            // You need to restart
            // Languages are in node_modules/prismjs/components
            additionalLanguages: ['bash'],
        },
    } satisfies Preset.ThemeConfig,
};

export default config;
