; ModuleID = 'src/network/proto.c'
source_filename = "src/network/proto.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.protoent = type { i8*, i8**, i32 }

@idx = internal unnamed_addr global i32 0, align 4
@getprotoent.p = internal global %struct.protoent zeroinitializer, align 8
@getprotoent.aliases = internal global i8* null, align 8
@protos = internal constant [239 x i8] c"\00ip\00\01icmp\00\02igmp\00\03ggp\00\04ipencap\00\05st\00\06tcp\00\08egp\00\0Cpup\00\11udp\00\14hmp\00\16xns-idp\00\1Brdp\00\1Diso-tp4\00$xtp\00%ddp\00&idpr-cmtp\00)ipv6\00+ipv6-route\00,ipv6-frag\00-idrp\00.rsvp\00/gre\002esp\003ah\009skip\00:ipv6-icmp\00;ipv6-nonxt\00<ipv6-opts\00Irspf\00Qvmtp\00Yospf\00^ipip\00bencap\00gpim\00\FFraw\00", align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn writeonly
define void @endprotoent() local_unnamed_addr #0 {
  store i32 0, i32* @idx, align 4, !tbaa !3
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn writeonly
define void @setprotoent(i32 noundef %0) local_unnamed_addr #0 {
  store i32 0, i32* @idx, align 4, !tbaa !3
  ret void
}

; Function Attrs: nounwind optsize strictfp
define %struct.protoent* @getprotoent() local_unnamed_addr #1 {
  %1 = load i32, i32* @idx, align 4, !tbaa !3
  %2 = icmp ugt i32 %1, 238
  br i1 %2, label %16, label %3

3:                                                ; preds = %0
  %4 = zext i32 %1 to i64
  %5 = getelementptr inbounds [239 x i8], [239 x i8]* @protos, i64 0, i64 %4
  %6 = load i8, i8* %5, align 1, !tbaa !7
  %7 = zext i8 %6 to i32
  store i32 %7, i32* getelementptr inbounds (%struct.protoent, %struct.protoent* @getprotoent.p, i64 0, i32 2), align 8, !tbaa !8
  %8 = add nuw nsw i32 %1, 1
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds [239 x i8], [239 x i8]* @protos, i64 0, i64 %9
  store i8* %10, i8** getelementptr inbounds (%struct.protoent, %struct.protoent* @getprotoent.p, i64 0, i32 0), align 8, !tbaa !11
  store i8** @getprotoent.aliases, i8*** getelementptr inbounds (%struct.protoent, %struct.protoent* @getprotoent.p, i64 0, i32 1), align 8, !tbaa !12
  %11 = tail call i64 @strlen(i8* noundef nonnull %10) #3
  %12 = load i32, i32* @idx, align 4, !tbaa !3
  %13 = trunc i64 %11 to i32
  %14 = add i32 %13, 2
  %15 = add i32 %14, %12
  store i32 %15, i32* @idx, align 4, !tbaa !3
  br label %16

16:                                               ; preds = %0, %3
  %17 = phi %struct.protoent* [ @getprotoent.p, %3 ], [ null, %0 ]
  ret %struct.protoent* %17
}

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define %struct.protoent* @getprotobyname(i8* noundef %0) local_unnamed_addr #1 {
  store i32 0, i32* @idx, align 4, !tbaa !3
  br label %2

2:                                                ; preds = %5, %1
  %3 = tail call %struct.protoent* @getprotoent() #4
  %4 = icmp eq %struct.protoent* %3, null
  br i1 %4, label %10, label %5

5:                                                ; preds = %2
  %6 = getelementptr inbounds %struct.protoent, %struct.protoent* %3, i64 0, i32 0
  %7 = load i8*, i8** %6, align 8, !tbaa !11
  %8 = tail call i32 @strcmp(i8* noundef %0, i8* noundef %7) #3
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %2

10:                                               ; preds = %2, %5
  ret %struct.protoent* %3
}

; Function Attrs: optsize
declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define %struct.protoent* @getprotobynumber(i32 noundef %0) local_unnamed_addr #1 {
  store i32 0, i32* @idx, align 4, !tbaa !3
  br label %2

2:                                                ; preds = %5, %1
  %3 = tail call %struct.protoent* @getprotoent() #4
  %4 = icmp eq %struct.protoent* %3, null
  br i1 %4, label %9, label %5

5:                                                ; preds = %2
  %6 = getelementptr inbounds %struct.protoent, %struct.protoent* %3, i64 0, i32 2
  %7 = load i32, i32* %6, align 8, !tbaa !8
  %8 = icmp eq i32 %7, %0
  br i1 %8, label %9, label %2

9:                                                ; preds = %2, %5
  ret %struct.protoent* %3
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
!8 = !{!9, !4, i64 16}
!9 = !{!"protoent", !10, i64 0, !10, i64 8, !4, i64 16}
!10 = !{!"any pointer", !5, i64 0}
!11 = !{!9, !10, i64 0}
!12 = !{!9, !10, i64 8}
