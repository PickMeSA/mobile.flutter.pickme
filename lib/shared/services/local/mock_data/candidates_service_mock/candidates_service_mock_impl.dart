import 'package:injectable/injectable.dart';
import 'package:pickme/shared/domain/entities/candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/paginated_candidate_profile_entity.dart';
import 'package:pickme/shared/domain/entities/pagination_entity.dart';
import 'package:pickme/shared/remote/api-service.dart';

import '../../../remote/api_service/candidates_service/candidates_service.dart';

@Singleton(as: CandidatesService)
class CandidatesServiceMock extends CandidatesService{

  final ApiService apiService;

  CandidatesServiceMock({required this.apiService});

  @override
  Future<PaginatedCandidateProfileEntity> getPaginatedCandidateProfiles() async {

    List<CandidateProfileEntity> candidateProfileList = [
      CandidateProfileEntity(
        id: "1",
        about: "Hi, I'm Andrew, a skilled Handyman ready to tackle a diverse range of tasks with precision and efficiency. From minor repairs and maintenance to carpentry and electrical work, I bring a hands-on approach and a commitment to customer satisfaction. With a keen eye for detail and a problem-solving mindset, I'm dedicated to making homes and spaces functional and aesthetically pleasing. Let's transform your projects into reality.",
        skills: "Electrical Work,Plumbing,Gardening",
        fullName: "Andrew Sithole",
        jobTitle: 'Handy man',
        hourlyRate: 40,
        rating: 4,
        profilePicture: "https://images.unsplash.com/photo-1570158268183-d296b2892211?q=80&w=3456&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        photos: "https://images.unsplash.com/photo-1620653713380-7a34b773fef8?q=80&w=3345&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D,https://images.unsplash.com/photo-1585704032915-c3400ca199e7?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        workExperience: [WorkExperienceEntity(name: "Care taker", institutionName: "Old mutual", period: "Sept 2012 - Dec 2023")]
      ),
      CandidateProfileEntity(
          id: "2",
          about: "Hello, I'm Freedom, a proficient Flutter Engineer passionate about crafting seamless cross-platform applications. With expertise in Dart programming, UI/UX design, and integration of RESTful APIs, I bring a creative approach to developing visually appealing and high-performance mobile applications. My commitment to staying abreast of Flutter's latest advancements ensures that I deliver cutting-edge solutions. Let's embark on a journey to create engaging and responsive mobile experiences.",
          skills: "Flutter,bloc,Git,App Development",
          fullName: "Freedom Mathebula",
        jobTitle: 'Flutter engineer',
        rating: 3,
        hourlyRate: 30,
        profilePicture: "https://images.unsplash.com/photo-1664575600796-ffa828c5cb6e?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          photos: "",
          workExperience: [WorkExperienceEntity(name: "Senior Flutter engineer", institutionName: "DVT", period: "Nov 2012 - Dec 2014")]
      ),
      CandidateProfileEntity(
          id: "2",
          about: "Hello, I'm Thulane, a passionate Node.js Backend Developer with a knack for crafting robust and scalable server-side applications. Armed with in-depth knowledge of Node.js, Express, and database management, I thrive on turning complex ideas into efficient, maintainable code. I bring a proactive approach to problem-solving and a commitment to staying current with emerging technologies. Let's build innovative solutions together!",
          skills: "Node,Javascript,Git",
          fullName: "Thulane Khumalo",
        jobTitle: 'Backend engineer',
        rating: 3,
        hourlyRate: 30,
        profilePicture: "https://images.unsplash.com/flagged/photo-1577605047476-202951cec757?q=80&w=2912&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          photos: "",
          workExperience: [WorkExperienceEntity(name: "Node engineer", institutionName: "DSTV", period: "Jul 2021 - Jun 2022")]
      ),
      CandidateProfileEntity(
          id: "2",
          about: "Greetings, Ruan, a dedicated miner with a strong commitment to safety and efficiency in extractive operations. Armed with hands-on experience in various mining techniques and equipment, I've contributed to successful mineral extraction projects. My adaptability, attention to detail, and adherence to industry regulations make me a reliable asset in challenging mining environments. Let's delve into new opportunities and unearth success together.",
          skills: "Mining,gold,platinum",
          fullName: "Ruan Botha",
        jobTitle: 'Miner',
        rating: 3,
        hourlyRate: 80,
        profilePicture: "https://plus.unsplash.com/premium_photo-1663050931089-6ad2058e5020?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          photos: "https://images.unsplash.com/photo-1510127034890-ba27508e9f1c?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D,https://images.unsplash.com/photo-1520854221256-17451cc331bf?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          workExperience: [WorkExperienceEntity(name: "Care taker", institutionName: "Old mutual", period: "Sept 2012 - Dec 2023")]
      ),
      CandidateProfileEntity(
          id: "2",
        about: "Hello, I'm Zaahidah, an accomplished Delivery Manager adept at overseeing end-to-end delivery processes. With a proven track record of optimizing logistics and ensuring timely, cost-effective deliveries, I excel in team coordination, resource management, and client communication. My strategic planning and problem-solving skills contribute to successful project outcomes. Let's collaborate to streamline your delivery operations and exceed customer expectations.",
        skills: "Team Leadership,Jira,ADO,Communication,Conflict resolution",
          fullName: "Zaahidah",
        jobTitle: 'Boss',
        rating: 3,
        hourlyRate: 80,
          photos: "",
          workExperience: [WorkExperienceEntity(name: "Care taker", institutionName: "Old mutual", period: "Sept 2012 - Dec 2023")]
    ),
    ];
    PaginationEntity paginationEntity = PaginationEntity(
        pageSize: 10,
        pageNumber: 1,
        total: candidateProfileList.length,
        totalPages: candidateProfileList.length~/10 + (candidateProfileList.length%10),
        nextPage: null,
        prevPage: null,
        searchTerm: ""
    );
    return Future.value(PaginatedCandidateProfileEntity(pagination: paginationEntity, candidates: candidateProfileList));
  }




}