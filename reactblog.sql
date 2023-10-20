-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 02, 2023 at 02:29 AM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reactblog`
--
CREATE DATABASE IF NOT EXISTS `reactblog` DEFAULT CHARACTER SET ucs2 COLLATE ucs2_general_ci;
USE `reactblog`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nume` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nume`) VALUES
(1, 'General'),
(2, 'Drept administrativ'),
(3, 'Drept penal'),
(4, 'Drept civil'),
(5, 'Drept fiscal');


-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `contacts` (
  `nume` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefon` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mesaj` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`nume`, `email`, `telefon`, `mesaj`) VALUES
('Maria', 'ddd@yahoo.com', '0723145789', 'mshs');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titlu` varchar(250) NOT NULL,
  `continut` text NOT NULL,
  `poza` varchar(64) DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  `categorie_id` int(11) NOT NULL DEFAULT '1',
  `dataadaugare` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title_UNIQUE` (`titlu`),
  KEY `category` (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `titlu`, `continut`, `poza`, `user_id`, `categorie_id`, `dataadaugare`) VALUES
(1, 'ICCJ: În cazul unei plângeri contravenționale, reclamantul poate să-și modifice cererea sau să aducă noi dovezi până la prima citare ', '<body>\r\n<p>“În ipoteza formulării unei plângeri contravenţionale, dispoziţiile legale mai sus invocate (art. 31 alin. (1) din OG nr. 2/2001 privind regimul juridic al contravenţiilor - n. red.) nu exclud de la aplicare prevederile art. 204 alin. (1) din Codul de procedură civilă”, a stabilit ICCJ prin decizia recentă.</p>\r\n\r\n<p> Astfel, potrivit art. 204 (1) din Codul de procedură civilă, reclamantul poate, atunci când depune o plângere contravențională, să își modifice cererea și să propună noi dovezi numai până la primul termen la care acesta este legal citat. </p>\r\n\r\n<p>În plus, același act normativ stabilește că “în acest caz, instanța dispune amânarea pricinii și comunicarea cererii modificate pârâtului, în vederea formulării întâmpinării, care, sub sancțiunea decăderii, va fi depusă cu cel puțin 10 zile înaintea termenului fixat, urmând a fi cercetată de reclamant la dosarul cauzei”.</p>\r\n\r\n<p>Prevederea din OG nr. 2/2001 privind regimul juridic al contravenţiilor despre care vorbește decizia ICCJ stabilește că împotriva procesului-verbal de constatare a contravenției și de aplicare a sancțiunii se poate face plângere în termen de 15 zile de la data înmânării sau comunicării acestuia.</p>\r\n\r\n<p>Conform ordonanței, partea vătămată poate face plângere numai în ceea ce privește despăgubirea, iar cel căruia îi aparțin bunurile confiscate, altul decât contravenientul, numai în ceea ce privește măsura confiscării.</p>\r\n\r\n<p><strong>Atenție!</strong> După publicarea în Monitorul Oficial, decizia ICCJ va deveni obligatorie pentru toate instanțele de judecată atunci când se confruntă cu dosare care vizează situații similare.</p>\r\n\r\n<h4>Principalele surse de informare folosite: </h4>\r\n<ol>\r\n<li>Codul de procedură civilă (Legea nr. 134/2010);</li>\r\n<li>OG nr. 2/2001 privind regimul juridic al contravenţiilor.</li>\r\n\r\n</ol>\r\n</body>', 'contraventie.jpg', 8, 4, '2023-06-30 20:53:22'),
(2, 'UPDATE! Pedepsele penale pentru infracțiunile violente au fost majorate', '<p>Pentru a crește nivelul de siguranță a cetățenilor, infracțiunile violente, care au un impact major asupra victimelor, vor fi pedepsite mai dur de acum înainte, potrivit celor mai recente modificări aduse Codului Penal. Astfel, pedepsele aferente lovirii sau vătămării corporale a unui minor ori în cazul în care agresiunea are loc în public, au fost majorate cu o treime. De asemenea, pedepsele prevăzute pentru fapte săvârșite împotriva judecătorilor, procurorilor, politiștilor, militarilor și agentilor silvici au fost majorate cu jumătate din cuantumul existent până acum.Codul penal a fost modificat prin Legea 248/2023, publicată vineri în Monitorul Oficial, astfel încât “infracțiunile cu un puternic impact emoțional și social”, așa cum spunea fostul ministru al afacerilor interne și unul dintre inițiatorii măsurii, să fie pedepsite mai dur.\r\n\r\nLa modul concret, se măresc cu o treime limitele pedepselor pentru lovire sau vătămare corporală în cazul în care:\r\nvictima se află în îngrijirea, ocrotirea, educarea, paza sau tratamentul făptuitorului;\r\nvictima este un minor;\r\nfapta este săvârșită în public;\r\nfăptuitorul are asupra sa o armă de foc, un obiect, un dispozitiv, o substanță sau un animal ce pot pune în pericol viața, sănătatea ori integritatea corporală a persoanelor.\r\nÎn plus, tot cu o treime se majorează și pedepsele pentru hărțuire, atunci când acțiunea este îndreptată împotriva unui minor.\r\n\r\nPrin această lege discutăm și de majorarea pedepselor pentru încăierare. Astfel, participarea la o încăierare e pedepsită cu închisoare de la șase luni la trei ani, limitele anterioare de pedeapsă fiind între trei luni și un an sau amendă.\r\n\r\nPentru tulburarea ordinii și liniștii publice, prin violențe comise în public împotriva persoanelor sau bunurilor, pedeapsa este închisoarea de la un an la cinci ani. În comparație, pedeapsa pentru tulburarea ordinii și liniștii publice, prin amenințări sau atingeri grave aduse în public demnității persoanelor, e închisoare de la trei luni la doi ani sau amendă.\r\n\r\nDacă tulburarea ordinii și liniștii publice e comisă prin violență fizică de o persoană ce are asupra sa o armă de foc, un obiect, un dispozitiv, o substanță sau un animal ce pot pune în pericol viața, sănătatea ori integritatea corporală a unei persoane, limitele speciale ale pedepsei se majorează cu o treime.\r\n\r\nDe asemenea, modificările aduse legii penale presupun majorarea cu jumătate a pedepselor aplicate pentru fapte ca amenințarea, lovirea, vătămarea sau uciderea unui procuror, judecător, cadru militar, polițist sau asupra unui funcționar silvic.\r\nPrincipalele surse de informare folosite\r\nCodul penal (Legea nr. 286/2009)\r\n</p>', 'pedepsePenale.jpg', 8, 3, '2023-07-01 20:34:46'),
(3, 'Regulile reducerii pedepsei pentru martorii denunțători, modificate ca urmare a unei decizii CCR', '<p>Legislația privind protecția martorilor a fost modificată, din 9 iulie, pentru a alinia textul legii cu o decizie a Curții Constituționale a României (CCR) din 2015. Mai exact, au fost aduse clarificări în legătură cu reducerea limitelor pedepselor celor care ajută la identificarea altor persoane care comit infracțiuni.\r\nModificările aduse, în 9 iulie, legislației privind protecția martorilor sunt cuprinse în Legea 200/2023. Astfel, acum, Legea 682/2002 stabilește că “persoana care are calitatea de martor (…) și care a comis o infracțiune, iar înaintea sau în timpul urmăririi penale ori al judecății denunță și facilitează identificarea și tragerea la răspundere penală a altor persoane care au săvârșit una dintre infracțiunile prevăzute la art. 2 lit. h) beneficiază de reducerea la jumătate a limitelor pedepsei prevăzute de lege”.\r\n\r\nÎnainte, legea nu detalia infracțiunile săvârșite de celelalte persoane, ci vorbea de “astfel de infracțiuni”, referindu-se la infracțiunile grave. Astfel, legea stabilea anterior că „persoana care are calitatea de martor (...) și care a comis o infracțiune gravă, iar înaintea sau în timpul urmăririi penale ori al judecății denunță și facilitează identificarea și tragerea la răspundere penală a altor persoane care au săvârșit astfel de infracțiuni beneficiază de reducerea la jumătate a limitelor pedepsei prevăzute de lege”.\r\n\r\nInfracțiunile prevăzute la art. 2 lit. h) (infracțiuni grave) din Legea 682/2002 sunt cele din următoarele categorii: genocid și infracțiuni contra umanității și infracțiuni de război, infracțiunile contra securității naționale, terorism, omor, infracțiunile privind traficul de droguri, traficul de persoane, traficul de minori, spălarea banilor, falsificarea de monede ori de alte valori, infracțiunile privitoare la nerespectarea regimului armelor, munițiilor, materialelor explozive, nucleare sau al altor materii radioactive, infracțiunile de corupție, precum și orice altă infracțiune pentru care legea prevede pedeapsa închisorii al cărei maxim special este de cel puțin 10 ani.\r\n\r\nPe de altă parte, poate fi considerat martor orice persoană care are calitatea de martor, așa cum stabilește Codul de procedură penală, și care, prin declarațiile sale, furnizează informații și date cu caracter determinant în aflarea adevărului cu privire la infracțiuni grave sau care contribuie la prevenirea producerii ori la recuperarea unor prejudicii deosebite ce ar putea fi cauzate prin săvârșirea unor astfel de infracțiuni.\r\n\r\nSpuneam că modificarea vine în urma apariției unei decizii CCR. Concret, prin Decizia 67/2015, CCR “a admis excepția de neconstituționalitate a dispozițiilor art. 19 din Legea nr. 682/2002 (articolul modificat recent - n. red.), constatându-se că soluția legislativă reglementată de art. 19 din Legea nr. 682/2002 care exclude de la beneficiul reducerii la jumătate a limitelor pedepsei prevăzute de lege persoana care are calitatea de martor (...) și care nu a comis o infracțiune gravă este neconstituțională”.\r\n\r\nLegea 200/2023 a aliniat legislația din mai multe domenii la o serie de decizii ale CCR. Printre altele, de pildă, a modificat definiția abuzului în serviciu.\r\n\r\n</p><p><br></p>', 'martoriiDenuntatori.jpg', 8, 3, '2023-07-01 20:39:56'),
(4, 'Conflicte de muncă: Locul unde se judecă dosarul se stabilește în funcție de cine face reclamația. Prevederea e constituțională', '<p>Codul muncii prevede că locul judecării conflictelor de muncă se stabilește în funcție de cine este reclamantul - la instanța din raza domiciliului salariatului sau la instanța din raza sediului angajatorului. Astfel, dacă angajatorul este reclamantul și salariatul trebuie să facă eforturi suplimentare pentru a participa la proces, nu ne aflăm în fața unei îngreunări a accesului la justiție, au apreciat, într-o decizie apărută recent, judecătorii Curții Constituționale a României (CCR).\r\n„Judecarea conflictelor de muncă este de competența instanțelor judecătorești, stabilite potrivit legii. Cererile (...) se adresează instanței competente în a cărei circumscripție reclamantul își are domiciliul sau reședința ori, după caz, sediul”, prevede, la articolul 269, Codul muncii, a doua frază fiind cea vizată de controlul de constituționalitate.\r\n\r\nPractic, judecătorilor CCR li s-a pus în vedere că, dacă angajatorul este reclamantul și procesul se derulează la instanța de la sediul acestuia, accesul la justiție este îngreunat pentru salariatul pârât. Asta în cazul în care domiciliul salariatului și sediul angajatorului se află în zone acoperite de instanțe diferite.\r\n\r\n„Această prevedere are urmarea imediată că, în cazul în care locul de muncă și/sau domiciliul angajatului nu se află în circumscripția instanței unde se află sediul angajatorului, accesul la justiție al pârâtului persoană fizică este îngreunat atât din perspectiva distanței pe care trebuie să o străbată pentru a participa la proces, cât și din cea a modului impropriu al administrării unor probe (declarații ale martorilor, cercetare locală etc.) în altă parte decât în zona în care s-au petrecut faptele probatorii”, au motivat cei care au făcut sesizarea de neconstituționalitate, conform Deciziei CCR 335/2022 (de respingere), care a apărut recent în Monitorul Oficial.\r\n\r\nTotuși, judecătorii CCR au tras concluzia că nu se poate vorbi de îngreunarea accesului la justiție în situația în care angajatorul este reclamantul. Practic, salariatul este favorizat în situația în care el este reclamantul, dar în situația în care este pârâtul nu poate fi, de asemenea, favorizat - sunt situații complet diferite și, astfel, un tratament diferit este justificat.\r\n\r\n„Or, analizând textul de lege criticat prin prisma celor mai sus reținute, Curtea constată că scopul pe care legiuitorul l-a avut în vedere atunci când a instituit o reglementare favorabilă salariaților sub aspectul instanței competente să judece conflictele de muncă în care au calitatea de reclamanți l-a constituit, așa cum s-a reținut mai sus, facilitarea accesului la justiție, astfel încât să nu fie descurajați să se adrese instanțelor de judecată pentru apărarea drepturilor ce derivă din raportul de muncă. Acest obiectiv este realizat atunci când salariatul este reclamant.\r\n\r\nCurtea reține și că, reglementând această soluție legislativă, legiuitorul a avut în vedere faptul că, în cele mai multe cazuri, acțiunile referitoare la conflictele individuale de muncă sunt inițiate de salariați, astfel că reglementarea este concepută din această perspectivă, tinzând să avantajeze pe salariații reclamanți.\r\n\r\nÎn același timp, Curtea constată că, atunci când salariații au calitatea de pârât, acțiunea în justiție este deja inițiată de angajatori, astfel că nu se poate susține că salariații sunt împiedicați să se adreseze justiției pentru apărarea drepturilor lor. Prin urmare, situația în care aceștia se află este în mod obiectiv diferită de cea în care salariații au calitatea de reclamant, tratamentul juridic diferit fiind justificat”, explică judecătorii în motivarea deciziei prin care au respins excepția de neconstituționalitate ridicată.\r\n\r\nCu alte cuvinte, Legiuitorul nu poate să dezavantajeze angajatorul în ambele situații, prin plasarea competenței de soluționare a conflictelor de muncă numai la domiciliul salariatului.\r\n\r\n„De altfel, Curtea apreciază că necesitatea protejării drepturilor salariaților, aflați într-o poziție de subordonare în raportul de muncă față de angajator, inclusiv sub aspectul facilitării accesului la justiție, nu se poate converti în temeiul unor reglementări inechitabile, în care angajatorul este plasat în toate cazurile într-o poziție defavorabilă în raport cu salariatul din punctul de vedere al drepturilor procesuale”, mai scrie în decizia CCR.\r\n\r\nPotrivit Codului muncii, conflictele de muncă vizează, în esență, chestiuni referitoare la încheierea, executarea, modificarea, suspendarea și încetarea contractelor individuale sau colective de muncă. Cererile pentru soluționarea unui conflict de muncă pot fi formulate:\r\nîn termen de 45 de zile calendaristice de la data la care cel interesat a luat cunoștință de măsura dispusă referitoare la încheierea, executarea, modificarea, suspendarea sau încetarea contractului individual de muncă, inclusiv angajamentele de plată a unor sume de bani;\r\nîn termen de 30 de zile calendaristice de la data în care s-a comunicat decizia de sancționare disciplinară;\r\nîn termen de trei ani de la data nașterii dreptului la acțiune, în situația în care obiectul conflictului individual de muncă constă în plata unor drepturi salariale neacordate sau a unor despăgubiri către salariat, precum și în cazul răspunderii patrimoniale a salariaților față de angajator;\r\npe toată durata existenței contractului, în cazul în care se solicită constatarea nulității unui contract individual sau colectiv de muncă ori a unor clauze aferente;\r\nîn termen de șase luni de la data nașterii dreptului la acțiune, în cazul neexecutării contractului colectiv de muncă ori a unor clauze ale acestuia.\r\nÎn celelalte situații, Codul stabilește că termenul este de trei ani de la data nașterii dreptului.\r\n</p>', 'conflictMunca.jpg', 8, 1, '2023-07-01 21:48:53'),
(5, 'CJUE: Stabilirea a două cote diferite de TVA pentru un produs, în funcție de cum se face vânzarea, e în acord cu Directiva de TV', '<p>Directiva europeană de TVA permite statelor membre să aibă cote reduse diferite de TVA pentru alimentele compuse din același ingredient principal, care să se aplice în funcție de cum se face vânzarea acestora, însă numai în anumite condiții, a hotărât joi Curtea de Justiție a Uniunii Europene (CJUE). În speță era vorba despre o băutură lactată care era taxată cu 5% dacă era vândută la magazin și cu 8% dacă era vândută la cafenea.\r\nJudecătorii au stabilit, în cauza C-146/22 (Polonia), că Directiva europeană de TVA „nu se opune unei reglementări naționale care prevede că alimente compuse din același ingredient principal și care răspund aceleiași nevoi pentru un consumator mediu sunt supuse la două cote reduse de taxă pe valoarea adăugată (TVA) diferite, după cum sunt vândute cu amănuntul într-un magazin sau sunt preparate și livrate calde unui client, la cerere, în vederea consumului lor imediat, în măsura în care aceste alimente nu prezintă proprietăți analoage în pofida ingredientului principal pe care îl au în comun sau în care diferențele existente între produsele respective, inclusiv în ceea ce privește serviciile conexe care însoțesc furnizările lor, influențează în mod considerabil decizia consumatorului mediu de a cumpăra una sau alta dintre acestea.”\r\n\r\nÎn speța ajunsă la CJUE era vorba de o firmă poloneză care vindea în cafenelele sale o ciocolată caldă preparată pe bază de lapte și sos de ciocolată. Conform autorităților fiscale poloneze, în acest caz, vânzarea la pachet și vânzarea pentru consumul în cafenea a băuturii menționate trebuiau considerate livrări de bunuri însoțite de servicii accesorii, pentru care se aplica o cotă redusă de TVA de 8%. Însă compania a contestat această interpretare, fiind de părere că trebuia aplicată o cotă redusă de TVA de 5%, ce era valabilă pentru vânzarea în magazine a băuturilor lactate.\r\n\r\nAutoritățile au motivat că există o diferență ce justifică aplicarea a două cote diferite de TVA pentru băuturile lactate. Deosebirea între băutura gata preparată vândută în magazin și băutura caldă preparată la comandă într-o cafenea, ținând cont de preferințele individuale ale clientului, este că în cazul din urmă livrarea e însoțită de servicii accesorii (pregătirea și furnizarea băuturii către client pentru consumul imediat). Din argumentele judecătorilor de la CJUE reiese că, pentru a justifica aplicarea a două cote reduse diferite de TVA, este de ajuns ca diferențele între felul în care este preparată băutura de la magazin și felul în care este preparată băutura de la cafenea să influențeze considerabil decizia clientului. Însă această chestiune trebuie verificată de instanța judecătorească ce se confruntă cu o asemenea speță.\r\n\r\n„(...) instanța de trimitere va trebui să stabilească, primo, dacă băuturile lactate în discuție în litigiul principal prezintă proprietăți analoage, secundo, dacă acestea răspund acelorași nevoi ale consumatorului și, tertio, dacă diferențele dintre aceste băuturi lactate exercită o influență determinantă asupra opțiunii consumatorului mediu de a cumpăra una sau alta dintre băuturile respective. Trebuie subliniat în această privință că este suficient în special ca al treilea criteriu să fie îndeplinit pentru a se considera că bunurile sau prestările de servicii în cauză nu sunt similare și pentru ca supunerea lor la cote de TVA reduse diferite să nu încalce, în consecință, principiul neutralității fiscale (...)”, este explicat în decizia CJUE.\r\n\r\nO situație similară celei din Polonia a apărut în România la 1 noiembrie 2018, atunci când livrarea de alimente avea o cotă redusă de TVA de 9%, iar prestarea serviciilor de restaurant și catering ajunsese să aibă o cotă redusă de TVA de 5%. În esență, pentru mâncarea servită în restaurant se aplica un TVA de 5%, în timp ce pentru mâncarea luată la pachet sau livrată domiciliu se aplica în continuare un TVA de 9%. În prezent, livrarea de alimente și prestarea serviciilor de restaurant și catering se află din nou la acceași cotă redusă de TVA - 9%.\r\n\r\nImportant! Deciziile CJUE sunt obligatorii pentru toate instanțele judecătorești din UE care se pot confrunta cu spețe similare.</p>', 'tva.png', 8, 5, '2023-07-01 21:54:25'),
(6, 'Polițiștii vor putea amenda șoferii în baza înregistrărilor camerelor de bord sau de supraveghere', '<p>Cei ce surprind diverse posibile încălcări ale regulilor rutiere vor putea trimite înregistrările audio-video polițiștilor, care, în baza acestora, dar și a altor mijloace de probă, vor putea sancționa șoferii care se abat de la regulile Codului rutier, potrivit unui proiect de ordonanță aflat în dezbatere publică. Pentru sancționarea șoferilor indisciplinați în trafic, polițiștii vor putea utiliza, de asemenea, date de monitorizare a traficului rutier primite de la administratorii drumurilor publice.\r\nPrintre mai multe schimbări pe care le va aduce Codului rutier, proiectul de OUG aflat în dezbatere publică va introduce posibilitatea ca șoferii să fie sancționați și în baza unor înregistrări audio-video primite de polițiști de la alți participanți la trafic sau de la administratorii drumurilor publice.\r\n\r\nMai exact, proiectul prevede că „polițistul rutier poate constata contravenții și cu ocazia verificării unei sesizări cu privire la o posibilă faptă de nerespectare a unei reguli de circulație de către un conducător de autovehicul, tractor agricol sau forestier ori tramvai, a cărei producere a fost percepută de către un alt participant la trafic și surprinsă de acesta într-o înregistrare audio-video sau video, după caz”.\r\n\r\nPractic, acum se introduce o excepție de la actuala regulă, care stabilește că polițiștii rutieri trebuie să constate contravențiile direct sau cu ajutorul unor mijloace tehnice certificate sau mijloace tehnice omologate și verificate metrologic.\r\n\r\nAstfel, cei ce au fost martori ai încălcării unor reguli de circulație vor putea încărca înregistrarea ce conține evenimentul rutier, făcută cu camera de bord sau cu telefonul, de pildă, pe un site web. Sesizarea va trebui făcută poliției rutiere pe raza căreia a avut loc presupusa încălcare a regulilor rutiere.\r\n\r\nVor putea fi constatate și sancționate de polițiști, în baza înregistrărilor video primite, următoarele abateri:\r\nnerespectarea semnificației culorii roșii a semaforului;\r\nadoptarea unui comportament agresiv în conducerea vehiculelor pe drumurile publice;\r\nneacordarea priorității de trecere pietonilor angajați în traversarea regulamentară a drumului public prin locurile special amenajate și semnalizate, aflați pe sensul de deplasare a autovehiculului, tractorului agricol sau forestier ori tramvaiului;\r\nneacordarea priorității de trecere vehiculelor care au acest drept;\r\nnerespectarea regulilor privind depășirea;\r\nneoprirea la trecerea la nivel cu calea ferată când barierele sau semibarierele sunt coborâte ori în curs de coborâre sau când semnalele cu lumini roșii și/ sau sonore sunt în funcțiune;\r\nefectuarea, de către conducătorul de autovehicul, pe autostradă sau pe drumul expres, a manevrei de întoarcere sau de mers înapoi, a circulației în sens contrar sensului de circulație, a circulației sau traversării de pe un sens de circulație pe celălalt prin zonele interzise, respectiv prin zona mediană sau racordurile dintre cele două părți carosabile.\r\nPentru a fi considerată validă și luată în seamă de polițiști, o înregistrare video va trebui să aibă:\r\nextrasul cadrului din filmarea audio-video sau video care surprinde posibila faptă contravențională percepută de participantul la trafic;\r\ndata și ora când a fost surprinsă posibila faptă contravențională;\r\nvehiculul implicat și numărul de înmatriculare ori înregistrare al acestuia, după caz;\r\nsemnalizarea rutieră a sectorului de drum public pe care a fost surprinsă posibila faptă contravențională, relevantă pentru constatarea acesteia.\r\nPe de altă parte, o sesizare va fi clasată direct dacă înregistrarea lipsește sau nu cuprinde toate elementele amintite mai sus, dacă datele celui care depune sesizarea lipsesc, dacă acesta refuză să-și asume, prin declarație pe propria răspundere, sesizarea formulată, dar și să dea detalii privind împrejurările în care a surprins posibila faptă contravențională ori dacă ajunge la polițiști mai târziu de 30 zile de la data surprinderii posibilei fapte contravenționale.\r\nAceastă măsură urmărește „implicarea societății civile în procesul de semnalare a unor abateri grave la regimul rutier, pentru a consolida gradul de disciplină în trafic”, după cum apare în nota de fundamentare a proiectului de OUG.\r\n\r\n\r\nȘoferii, sancționați și în baza filmărilor camerelor de supraveghere\r\n\r\nDe asemenea, polițiștii vor putea prelucra datele de monitorizare a traficului rutier colectate de administratorii drumurilor publice de interes județean sau local cu ajutorul unor mijloace tehnice instalate pe drumurile pe care le administrează și, dacă este cazul, în baza lor să aplice sancțiuni șoferilor.\r\n\r\nÎn aceste cazuri se va verifica eventuala încălcare a normelor de circulație pe drumurile publice sau în cazul prezenței în trafic a unor vehicule supuse confiscării, căutate potrivit legii, ori care pot fi utilizate ca probă într-o procedură judiciară.\r\n\r\nPosibila încălcare a normelor de circulație pe drumurile publice va viza:\r\nlimita maximă admisă de viteză pentru categoria de vehicul pe un anumit sector de drum;\r\ninterdicția sau restricția de a conduce un vehicul pe o bandă a sensului de deplasare;\r\nsemnificația culorii roșii a semaforului;\r\ninterdicția de a conduce pe drumurile publice un vehicul a cărui înmatriculare este suspendată;\r\ntrecerea la nivel cu calea ferată;\r\ninterdicția de a adopta un comportament agresiv în conducerea vehiculelor pe drumurile publice;\r\ndepășirea coloanelor de vehicule oprite la culoarea roșie a semaforului sau la trecerile la nivel la calea ferată.\r\nÎn 2022, un proiect de lege ce conținea măsuri similare a fost respins definitiv în Parlament, ceea ce face ca acestea să nu se aplice în prezent.</p>', 'amenda.jpg', 8, 2, '2023-07-01 23:25:36'),
(7, 'Autoritățile își asumă riscuri în materia GDPR prin folosirea WhatsApp în comunicarea cu cetățenii sau intra-instituțională', '<p> Autoritatea Națională de Supraveghere a Prelucrării Datelor cu Caracter Personal (ANSPDCP) avertizează autoritățile publice asupra riscurilor privind utilizarea WhatsApp pentru comunicarea cu cetățenii. Autoritatea subliniază necesitatea respectării GDPR și a menționat cazul Cambridge Analytica ca exemplu de riscuri în folosirea aplicațiilor de acest tip. Concluzia ANSPDCP este că folosirea aplicațiilor de tip WhatsApp poate ridica probleme legale și de conformitate cu normele referitoare la prelucrarea datelor.\r\nÎn raportul de activitate pe anul trecut, ANSPDCP menționează opinia trimisă unor autorități publice, inclusiv poliții locale, referitoare la \"utilizarea mijloacelor de comunicare între aceste autorități sau instituții, atât cu cetățenii, cât și în cadrul acestora, între angajați, prin intermediul telefonului personal sau prin aplicația WhatsApp\".\r\n\r\nRăspunsul Autorității face referire la obligația pe care instituțiile respective o au de a respecta prevederile Regulamentului european privind protecția datelor personale (GDPR).\r\n\r\nAutoritatea afirmă în documentul citat că instituțiile trebuie să ia și să respecte anumite măsuri tehnice și organizatorice în vederea asigurării confidențialității și securității prelucrării datelor, pentru a nu aduce atingere dreptului la viața privată sau protecției datelor personale ale cetățenilor cu care intră în contact, în conformitate cu prevederile GDPR.\r\n\r\nANSPDCP menționează o serie de riscuri de securitate de care autoritățățile publice trebuie să țină cont, cum ar fi \"distrugerea, pierderea, modificarea, divulgarea neautorizată sau accesul neautorizat la datele cu caracter personal transmise, stocate sau prelucrate\" prin intermediul aplicațiilor de tip WhatsApp.\r\n\r\nDe asemenea, ANSPDCP amintește în acest context scandalul \"Cambridge Analytica\", care a avut drept protagonist aplicația în discuție. În urma investigației desfășurate de autoritatea irlandeză în domeniu, WhatsApp a fost amendată cu 225 milioane de euro pentru efectuarea de schimburi de informații cu firma sa proprietară, Facebook (actuala Meta).\r\n\r\nReferitor la acest subiect, Autoritatea concluzionează arătând că o astfel de metodă de comunicare \"ridică problema conformității prelucrării sub aspectul legalității și proporționalității prelucrării, prevăzute de Regulamentul (UE)”.</p>', 'whatsApp.jpg', 0, 1, '2023-10-11 18:43:15');
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `nume` varchar(64) NOT NULL,
  `prenume` varchar(64) NOT NULL,
  `parola` varchar(256) NOT NULL,
  `dataadaugare` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `nume`, `prenume`, `parola`, `dataadaugare`) VALUES
(8, 'demo@yahoo.com', 'Demo', 'Ion', '$2a$10$ZBAkb.Z2jBTFopxRYFkbp.LeXALQmguACW28lp8CqhbjhcOhC1kj6', '2023-06-19 21:29:07');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`);
COMMIT;

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

  ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
