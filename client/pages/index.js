import Hero from '../components/Hero';
import Layout from '../components/Layout';
import classes from '../styles/pages/Home.module.css';
import Artists from '../components/Artists/Artists';
import Albums from '../components/Albums/RecAlbums';

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
