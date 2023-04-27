import "../styles/footer.css"
import { Link } from 'react-router-dom';
import app_version from "../version";


function Footer() {
  return (
    <div className="footer flex justify-center p-2 text-center bg-zinc-950">
      <div className="flex justify-center text-center flex-col">
        <p className="text-cyan-50 text-lg"><Link to="https://github.com/FBanitz/CESI-Devops-Digit-Transit" target="_blank">Github</Link></p>
        <p className="text-cyan-50 text-sm">Version {app_version}</p>
      </div>
    </div>
  );
}

export default Footer
