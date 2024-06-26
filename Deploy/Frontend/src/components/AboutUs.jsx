import React from 'react';
import './AboutUs.css';
import Agnes from './Photos/Humas_Agnes Priscilla Sekartaji Hadikusuma-modified.png';
import Lathifa from './Photos/Humas_Lathifah Sahda-modified.png';
import Brendan from './Photos/cropped_image.png';
// Import other photos as needed

const AboutUs = () => {
  const teamMembers = [
    {
      name: 'Lathifah Sahda',
      role: '5025221159',
      bio: 'Alhamdulillah mata kuliah ini berjalan dengan baik, terimakasih atas bimbingan Bu Shintami dalam menyampaikan materi hingga akhir final project ini. Semoga ilmu yang diberikan bermanfaat',
      photo: Lathifa, 
    },
    {
      name: 'Brendan Timothy M',
      role: '5025221177',
      bio: 'Pada mata kuliah MBD kali ini, sangat membantu dalam mempelajari cara memanajemen aplikasi database dengan sangat baik. Terima Kasih kepada Bu Shintami untuk pelajaran nya yang berharga.',
      photo: Brendan,
    },
    {
      name: 'Agnes Priscilla S.H.',
      role: '5025221295',
      bio: 'Terima kasih Bu Shintami karna sudah menjadi dosen MBD kami. Kami menjadi paham bagaimana membuat model data dan merancang data dengan baik.',
      photo: Agnes, 
    },
  ];

  return (
    <div className="about-us">
      <h2>Meet Our Team</h2>
      <div className="team-members">
        {teamMembers.map((member, index) => (
          <div key={index} className="member">
            <img src={member.photo} alt={member.name} className="member-photo" />
            <h3>{member.name}</h3>
            <h4>{member.role}</h4>
            <p>{member.bio}</p>
          </div>
        ))}
      </div>
    </div>
  );
};

export default AboutUs;
