import Head from 'next/head';
import Hero from '../components/Hero';
import Layout from '../components/Layout';
import classes from '../styles/Components.module.css';
import Artists from '../components/Artists/Artists';
// import Products from '../components/Products/Products';
import Albums from '../components/Albums/Albums';

export default function Home() {
  return (
    <div className={classes.app}>
      <Layout>
        <main className={classes.main}>
          <Hero />
          <Artists />
          <Albums />
        </main>
      </Layout>
    </div>
  );
}
