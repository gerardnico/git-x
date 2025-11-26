import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import Heading from '@theme/Heading';

import styles from './index.module.css';
import {JSX} from "react";

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className={clsx('hero', styles.heroBanner)}>
      <div className="container">
        <Heading as="h1" className="hero__title">
          {siteConfig.title}
        </Heading>
        <p className="hero__subtitle">{siteConfig.tagline}</p>
        <div className={styles.buttonBar}>
          <div className={styles.buttons}>
            <Link
              className="button button--secondary button--lg"
              to={siteConfig.baseUrl + "docs/git-flow"}>
              Git Flow
            </Link>
          </div>
          <div className={styles.buttons}>
            <Link
              className="button button--secondary button--lg"
              to={siteConfig.baseUrl + "docs/git-backup"}>
              Git Backup
            </Link>
          </div>
          <div className={styles.buttons}>
            <Link
              className="button button--secondary button--lg"
              to={siteConfig.baseUrl + "docs/git-exec"}>
              Git Multi-Execution
            </Link>
          </div>
        </div>
      </div>
    </header>
  );
}

export default function Home(): JSX.Element {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout
      title={`Hello from ${siteConfig.title}`}
      description="Git commands for everyday use (Git Flow, Multiple repos command execution, Hosting Backup, ...)">
      <HomepageHeader/>
      <main>

      </main>
    </Layout>
  );
}
