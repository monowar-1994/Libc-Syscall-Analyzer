; ModuleID = 'src/passwd/getpwent.c'
source_filename = "src/passwd/getpwent.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type opaque
%struct.passwd = type { i8*, i8*, i32, i32, i8*, i8*, i8* }

@f = internal unnamed_addr global %struct._IO_FILE* null, align 8
@.str = private unnamed_addr constant [12 x i8] c"/etc/passwd\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"rbe\00", align 1
@pw = internal global %struct.passwd zeroinitializer, align 8
@line = internal global i8* null, align 8
@size = internal global i64 0, align 8

@endpwent = weak alias void (), void ()* @setpwent

; Function Attrs: nounwind optsize strictfp
define void @setpwent() #0 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @f, align 8, !tbaa !3
  %2 = icmp eq %struct._IO_FILE* %1, null
  br i1 %2, label %5, label %3

3:                                                ; preds = %0
  %4 = tail call i32 @fclose(%struct._IO_FILE* noundef nonnull %1) #3
  br label %5

5:                                                ; preds = %3, %0
  store %struct._IO_FILE* null, %struct._IO_FILE** @f, align 8, !tbaa !3
  ret void
}

; Function Attrs: optsize
declare i32 @fclose(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define %struct.passwd* @getpwent() local_unnamed_addr #0 {
  %1 = alloca %struct.passwd*, align 8
  %2 = bitcast %struct.passwd** %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @f, align 8, !tbaa !3
  %4 = icmp eq %struct._IO_FILE* %3, null
  br i1 %4, label %5, label %8

5:                                                ; preds = %0
  %6 = tail call %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)) #3
  store %struct._IO_FILE* %6, %struct._IO_FILE** @f, align 8, !tbaa !3
  %7 = icmp eq %struct._IO_FILE* %6, null
  br i1 %7, label %12, label %8

8:                                                ; preds = %0, %5
  %9 = phi %struct._IO_FILE* [ %6, %5 ], [ %3, %0 ]
  %10 = call i32 @__getpwent_a(%struct._IO_FILE* noundef nonnull %9, %struct.passwd* noundef nonnull @pw, i8** noundef nonnull @line, i64* noundef nonnull @size, %struct.passwd** noundef nonnull %1) #3
  %11 = load %struct.passwd*, %struct.passwd** %1, align 8, !tbaa !3
  br label %12

12:                                               ; preds = %5, %8
  %13 = phi %struct.passwd* [ %11, %8 ], [ null, %5 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #4
  ret %struct.passwd* %13
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i32 @__getpwent_a(%struct._IO_FILE* noundef, %struct.passwd* noundef, i8** noundef, i64* noundef, %struct.passwd** noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind optsize strictfp
define %struct.passwd* @getpwuid(i32 noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.passwd*, align 8
  %3 = bitcast %struct.passwd** %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %3) #4
  %4 = call i32 @__getpw_a(i8* noundef null, i32 noundef %0, %struct.passwd* noundef nonnull @pw, i8** noundef nonnull @line, i64* noundef nonnull @size, %struct.passwd** noundef nonnull %2) #3
  %5 = load %struct.passwd*, %struct.passwd** %2, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %3) #4
  ret %struct.passwd* %5
}

; Function Attrs: optsize
declare hidden i32 @__getpw_a(i8* noundef, i32 noundef, %struct.passwd* noundef, i8** noundef, i64* noundef, %struct.passwd** noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define %struct.passwd* @getpwnam(i8* noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.passwd*, align 8
  %3 = bitcast %struct.passwd** %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %3) #4
  %4 = call i32 @__getpw_a(i8* noundef %0, i32 noundef 0, %struct.passwd* noundef nonnull @pw, i8** noundef nonnull @line, i64* noundef nonnull @size, %struct.passwd** noundef nonnull %2) #3
  %5 = load %struct.passwd*, %struct.passwd** %2, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %3) #4
  ret %struct.passwd* %5
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
